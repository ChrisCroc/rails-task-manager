class TasksController < ApplicationController

    before_action :select_task, only: [ :show, :edit, :update, :destroy, :toggle ]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def show
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  def toggle
    @task.toggle!(:completed)
    redirect_to tasks_path
  end
end

private

def task_params
  params.require(:task).permit(:title, :details, :completed)
end

def select_task
  @task = Task.find(params[:id])
end
