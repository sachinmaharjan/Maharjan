class StatsController < ApplicationController
    before_filter :authenticate, :only => [:index]

  def index
    @user = current_user
    @tasks = Task.find_all_by_user_id(@user)
    @completed = Task.find_all_by_user_id_and_is_completed(@user.id, true)
    @chart = piechart(@tasks.count, @completed.count)
  end

  private
    def piechart(tasks, completed)
      @chart = GoogleChart::PieChart.new('320x200', "Pie Chart",false) do |pc|
        pc.data "Completed", completed
        pc.data "Incomplete", (tasks - completed)
        pc.show_labels = true
      end
    end

    def authenticate
      if current_user.blank?
        redirect_to signin_path, :alert => "Please sign in to access this page."
      end
    end
end
