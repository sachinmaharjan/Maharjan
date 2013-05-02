class MaharjanMailer < ActionMailer::Base

	def welcome_email(user)
		mail :subject => "Welcome #{user.name}",
			 :to      => user.email,
			 :from    => "sachin.gen@gmail.com",
			 :body    => "Your account has been successfully created."
	end

end