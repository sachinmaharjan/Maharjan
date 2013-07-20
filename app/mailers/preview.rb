class Preview < MailView
  def welcome_email
    MaharjanMailer.welcome_email(User.first)
  end
end