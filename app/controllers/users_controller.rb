class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
    
  end
  
  def create
    @user = User.new(user_params)
    @user.role = Role.find_by_name('user')
    if @user.save
      redirect_to root_path, notice: 'User created'
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
