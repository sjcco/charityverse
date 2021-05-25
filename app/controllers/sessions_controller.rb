class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_name(params[:name])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back #{user.name}, you are succesfully logged in"
    else
      flash.alert = 'User does not exists'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Succesfully logged out'
  end
end
