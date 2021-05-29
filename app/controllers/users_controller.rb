class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash.notice = "User #{@user.name} has succesfully signed in"
      redirect_to user_path(@user)
    else
      flash.alert = 'User name already exists'
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
