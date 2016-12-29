class ApplicationController < ActionController::Base
  def authenticate_user!
     render nothing: true, status: 401 if current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :authenticate_user!, :current_user
end
