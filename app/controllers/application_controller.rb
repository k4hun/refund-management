class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def authenticate_user
    session[:return_to] = request.fullpath
    redirect_to login_path, alert: 'You must be logged in!' unless session[:user_id].present?
  end
end
