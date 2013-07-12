class SessionsController < ApplicationController

  def new
  end
  
  def create 
     if params[:session]
      user = User.authenticate(params[:session][:email], params[:session][:password])
    else 
      user = User.from_omniauth(env["omniauth.auth"]) 
    end
    if !user.nil?
      session[:user_id] = user.id
      redirect_to tasks_path
    else
      flash[:error] = "Unable to login with the username and password"
      redirect_to signin_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to signin_path
  end
  
end
