module Api
  class TasksController < ApplicationController
    def show
      @task = Task.find_by(id: params[:id])

      return render 'not_found', status: :not_found if not @task
      render 'show', status: :ok
    end

    def index
      @tasks = Task.all
      render 'index', status: :ok
    end

    def create
      @task = Task.new(task_params)

      return render 'bad_request', status: :bad_request if not @task.save
      render 'show', status: :ok
    end

    def destroy
      @task = Task.find_by(id: params[:id])

      return render 'not_found', status: :not_found if not @task
      return render 'bad_request', status: :bad_request if not @task.destroy
      render json: { success: true }, status: :ok
    end

    def update
      @task = Task.find_by(id: params[:id])

      return render 'not_found', status: :not_found if not @task
      return render 'bad_request', status: :bad_request if not @task.update(task_params)
      render 'show', status: :ok
    end

    def mark_complete
      @task = Task.find_by(id: params[:id])

      return render 'not_found', status: :not_found if not @task
      return render 'bad_request', status: :bad_request if not @task.update(completed: true)
      render 'show', status: :ok
    end

    def mark_active
      @task = Task.find_by(id: params[:id])

      return render 'not_found', status: :not_found if not @task
      return render 'bad_request', status: :bad_request if not @task.update(completed: false)
      render 'show', status: :ok
    end

    private

    def task_params
      params.require(:task).permit(:content, :due)
    end
  end
end