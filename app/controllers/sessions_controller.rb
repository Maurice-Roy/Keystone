class SessionsController < ApplicationController
  skip_before_action :current_user, only: [:new, :create, :destroy]
  skip_before_action :require_logged_in, only: [:new, :create, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    check_user = @user.try(:authenticate, params[:password])
    if check_user
      session[:user_id] = check_user.id
      redirect_to '/'
    else
      flash[:error] = "User/Password does not match"
      redirect_to '/login'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
