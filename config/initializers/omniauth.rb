OmniAuth.config.logger = Rails.logger

OmniAuth.config.on_failure = Proc.new do |env|
  UsersController.action(:omniauth_failure).call(env)
  #this will invoke the omniauth_failure action in UsersController.
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
end