class TaskListsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user
      .client
      .task_list(
        :index,
        organization_id: params[:organization_id],
        project_id: params[:project_id]
      )
      .all
  end

  def create
    task_list = current_user
      .client
      .task_list(
        :create,
        organization_id: params[:organization_id],
        project_id: params[:project_id],
        name: task_list_params[:name]
      )

    render json: task_list
  end

  def update
    task_list = current_user
      .client
      .task_list(
        :update,
        organization_id: params[:organization_id],
        project_id: params[:project_id],
        id: params[:id],
        name: task_list_params[:name]
      )

    render json: task_list
  end

  def show
    task_list = current_user.client.task_list(:show, id: params[:id])

    render json: task_list
  end

  def destroy
    render json: current_user.client.task_list(:delete, id: params[:id])
  end

  private

  def task_list_params
    params.require(:task_list).permit(:id, :name)
  end
end
