class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user
      .client
      .task(
        :index,
        organization_id: params[:organization_id],
        project_id: params[:project_id]
      )
      .all
  end

  def create
    task = current_user
      .client
      .task(
        :create,
        organization_id: params[:organization_id],
        project_id: params[:project_id],
        name: task_params[:name],
        task_list_id: task_params[:task_list_id]
      )

    render json: task
  end

  private

    def task_params
    params.require(:task).permit(:id, :name, :task_list_id)
  end
end
