class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :show]
  before_filter :correct_user, :only => [:edit, :update, :show]

  def new
  	@user = User.new
  	sign_out
  end
  
  def create
  	@user = User.new(params[:user])
  	if @user.save
  		# sign_in @user
      session[:user_id] = @user.id
  		flash[:success] = "Welcome! Your account has been create."
  		redirect_to @user
  		# do_something_here
  	else
  		render 'new'
  	end
  end
  
  def show
  	@user = find_user
    @tasks = Task.find_all_by_user_id(@user)
    @completed = Task.find_all_by_user_id_and_is_completed(@user.id, true)
    @chart = piechart(@tasks.count, @completed.count)
  end

  def edit
    @user = find_user
  end

  def update
    @user = find_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def omniauth_failure
    redirect_to signin_path
    #redirect wherever you want.
  end

  private
    def find_user()
      User.find(params[:id])
    end

    def piechart(tasks, completed)
      @chart = GoogleChart::PieChart.new('320x200', "Pie Chart",false) do |pc|
        pc.data "Completed", completed
        pc.data "Incomplete", (tasks - completed)
        pc.show_labels = true
      end
    end

    def linechart(tasks, completed)
      chart = GoogleChart::LineChart.new('320x200', "Line Chart",false)
      chart.data "Completed", completed
      chart.data "Incomplete", (tasks - completed)
      chart.show_labels = true
    end

    def authenticate
      if current_user.blank? 
        redirect_to signin_path, :alert => "Please sign in to access this page."
      end
    end

    def authenticate_admin
      unless current_user and current_user.admin?
        redirect_to signin_path, :alert => "You do not have access to this page."
      end
    end

    def correct_user
      @user = User.find(params[:id])
    
      if !current_user?(@user) 
        flash[:alert] = "You do not have access to this page."
        redirect_to signin_path  
      end
    end
end
