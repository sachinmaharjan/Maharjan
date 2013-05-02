class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def require_login
  	unless current_user
  		flash[:error] = "You must be logged in to access this feature"
  		redirect_to signin_path
  	end
  end

  private
  
  	def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
  	
  helper_method :current_user
end
