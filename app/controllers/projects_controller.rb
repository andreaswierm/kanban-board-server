class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.client.project(:index).all
  end
end
