class SessionsController < ApplicationController
  before_action :authenticate_user!, only: :get

  def get
    render json: current_user
  end

	def create
    @user = User.find_or_create_from_auth_hash(auth_hash)

    session[:user_id] = @user.id

    redirect_to Rails.application.secrets.client_url
  end

  def destroy
    session[:user_id] = nil

    render nothing: true, status: 204
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
