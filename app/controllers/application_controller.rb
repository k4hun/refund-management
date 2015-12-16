class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def authenticate_user
    redirect_to login_path, alert: 'You must be logged in!' unless session[:user_id].present?
  end

  def authenticate_admin
    redirect_to root_path, alert: 'For admin only!' unless current_user.role.name == 'admin'
  end
  
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
