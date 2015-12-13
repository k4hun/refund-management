class ApplicationsController < ApplicationController
  before_action :authenticate_user
  before_action :set_application, only: [:edit, :approve]
  
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

  def edit
  end

  def update
    if @application.update(approve_params)
      @application.approve
      redirect_to applications_path, notice: 'Application approved'
    else
      render 'edit'
    end    
  end

  def approve
    @application.approve
    redirect_to applications_path
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end
  
  def app_params
    params.require(:application).permit(:description)
  end

  def approve_params
    params.require(:application).permit(:category_id, :refund_value)
  end
end
