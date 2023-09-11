class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.save!

    render 'api/tasks/show'
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
