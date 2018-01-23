class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user, :require_logged_in
  helper_method :current_user, :logged_in?, :require_logged_in

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    # flash[:error] << "Need to log in!"
    redirect_to '/login' unless logged_in?
  end
end
