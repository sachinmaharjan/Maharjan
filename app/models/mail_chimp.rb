class MailChimp
  include Hominid

  def self.add_user(user)
    h = Hominid::API.new(MAIL_CHIMP[Rails.env]['api_key'])
    pp MAIL_CHIMP[Rails.env]['subscriber_list']
    h.list_subscribe(MAIL_CHIMP[Rails.env]['subscriber_list'], user.email, {'NAME' => user.name}, 'html', false, true, true, false)
  end

  def self.unsubscribe_user(user)
    h = Hominid::API.new(MAIL_CHIMP[Rails.env]['api_key'])
    h.list_unsubscribe(MAIL_CHIMP[Rails.env]['subscriber_list'], user.email)
  end

  def self.send_email(user)
  	s = Hominid::STS.new(MAIL_CHIMP[Rails.env]['api_key'], {:secure => true})
  	s.send_email(MAIL_CHIMP[Rails.env]['api_key'], {:to_email => [user.email], :text => 'Welcome, You have successfully created an account. '}, true, true)
  end
end
