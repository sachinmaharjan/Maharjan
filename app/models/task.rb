class Task < ActiveRecord::Base
  attr_accessible :completed_at, :headline, :is_completed, :private

  validates :headline, presence: true, length: {minimum: 2, maximum: 100}

  belongs_to :user
  has_many :like

  before_update :update_comepleted_time
  before_save :update_comepleted_time

  def update_comepleted_time
  	if is_completed && completed_at.nil?
  		self.completed_at = Time.now
  	end
  end

end
