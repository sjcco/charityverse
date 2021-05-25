class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    flash.notice = "User #{@user.name} has succesfully signed in"
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
