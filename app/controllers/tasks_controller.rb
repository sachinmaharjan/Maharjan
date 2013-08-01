class TasksController < ApplicationController
  before_filter :require_login , :only => [:index, :show, :new, :edit, :create, :update]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.find_all_by_user_id(current_user.id, :order => "created_at DESC")
    @completed = Task.find_all_by_user_id_and_is_completed(current_user.id, true)
    @deleted = Task.find_all_by_user_id_and_is_deleted(current_user.id, true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @task.user = current_user
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.is_deleted = true

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully deleted.' }
        format.json { render json: @task, status: :ok, location: @task }
      else
        format.html { render action: "show" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
end
