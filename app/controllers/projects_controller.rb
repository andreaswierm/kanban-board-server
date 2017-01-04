class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.client.project(:index, organization_id: params[:organization_id]).all
  end

  def create
    project = current_user.client.project(:create, organization_id: params[:organization_id], name: project_params[:name])

    render json: project
  end

  def update
    project = current_user
      .client
      .project(
        :update,
        organization_id: params[:organization_id],
        id: params[:id],
        name: project_params[:name]
      )

    render json: project
  end

  def show
    project = current_user.client.project(:show, id: params[:id])

    render json: project
  end

  private

  def project_params
    params.require(:project).permit(:id, :name)
  end
end

