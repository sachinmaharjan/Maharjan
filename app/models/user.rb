require 'digest'

class User < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation, :salt
  
  before_save { |user| user.email = email.downcase }
  before_save :encrypt_password
  after_create :create_user_with_welcome_email

  has_many :tasks
  
  validates :name, presence: true, length: { maximum: 50, minimum: 2}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
  validates :password, :presence =>true,
                      :confirmation => true,
                      :length => { :within => 6..40 }
                      
  validates :password_confirmation, presence: true

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.name = auth.extra.raw_info.name
       user.email = auth.info.email
       @password = SecureRandom.hex(10)
       user.password = @password
       user.password_confirmation = @password
       user.image = auth.info.image
       user.urls = auth.extra.raw_info.link
       user.location = auth.info.location
       user.oauth_token = auth.credentials.token
       user.oauth_expires_at = Time.at(auth.credentials.expires_at)
       user.save!
     end
  end

  def has_password?(submitted_password)
    self.salt = make_salt if new_record?
    self.encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = User.find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def create_user_with_welcome_email
    MailChimp.add_user(self)
    MaharjanMailer.welcome_email(self).deliver
  end

  private

    def secure_hash(password)
      Digest::SHA2.hexdigest(password)
    end

    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end
    
    def make_salt 
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def encrypt(password)
      secure_hash("#{salt}--#{password}")
    end
end
