class TasksController < ApplicationController
  def index
    @tasks = Task.order(edited_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = User.find(user_id)
    @task.status = Status.find(status_id)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.user = User.find(user_id)
    @task.status = Status.find(status_id)
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to tasks_path, notice: 'Task was deleted'
    else
      redirect_to @task, notice: 'Post cannot be deleted'
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def user_id
    params[:task][:user_id]
  end

  def status_id
    params[:task][:status_id]
  end
end
