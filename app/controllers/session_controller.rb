class SessionController < ApplicationController
  def new
  end
  
  def create
    auth = User.authenticate(params[:session][:email], params[:session][:password])
    if auth
      session[:user_id] = auth.id
      flash[:notice] = 'Logged in!'
      redirect_to root_path
    else
      redirect_to login_path, alert: 'Wrong user name or password!'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logged out!'
  end
end
