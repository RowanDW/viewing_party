class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.name}!"
      redirect_to dashboard_path
    else
      flash[:warning] = 'Error invalid user'
      redirect_to registration_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
