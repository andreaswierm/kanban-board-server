class OrganizationsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.client.organization(:index).all
  end
end

