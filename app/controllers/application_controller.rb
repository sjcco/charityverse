class ApplicationController < ActionController::Base
  private

  def user_signed_in?
    return false if session[:user_id].nil?

    true
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
