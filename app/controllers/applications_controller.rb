class ApplicationsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @applications = Application.all
    @user_apps = current_user.applications.all
  end

  def new
    @application = Application.new
  end
  
  def create
    @application = Application.new(app_params)
    @application.user = current_user
    if @application.save
      redirect_to applications_path, notice: 'Refund application has been sent to admin'
    else
      render 'new'
    end
  end

  def show
  end
  
  def app_params
    params.require(:application).permit(:category_id, :description)
  end
end
