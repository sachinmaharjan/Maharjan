class MaharjanMailer < ActionMailer::Base
  layout 'welcome_email'
  default from: 'taskrat@gmail.com'
  default url: 'http://protected-cliffs-4995.herokuapp.com/'

	def welcome_email(user)
    @user = user
    @url = 'http://protected-cliffs-4995.herokuapp.com/'
    mail(
      charset:       "utf-8",
      content_type:  "text/html",
      subject:       "Welcome #{@user.name}",
      to:            @user.email) do |format|
        format.html { render '/layouts/welcome_email' }
    end
  end
end