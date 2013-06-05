class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def index
    @task = Task.find(params[:task_id])
    @like = Like.find_by_task_id_and_user_id(params[:task_id], current_user.id)
    if @like.nil?
      @like = Like.new(:task_id => params[:task_id], :user_id => current_user.id, :like_count => 1)
      respond_to do |format|
        if @like.save
          format.json { render json: @like, status: :created, location: @like }
        else
          format.json { render json: @like.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.json { render json: @like, status: :im_used, location: @like }
      end
    end
  end

end
