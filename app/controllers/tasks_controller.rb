class TasksController < ApplicationController
  # before_action :set_task, only: [:show]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # create new instance of restaurant
    @task = Task.new
  end

  def create
    # save a new instance of restaurant with user-given parameters
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path(@tasks)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # redirecting to the path of this specific instance
    redirect_to tasks_path(@tasks)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path(@tasks)
  end

  private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:title, :details)
  end

  # def set_task
  #   @task = Task.find(params[:id])
  # end
end
