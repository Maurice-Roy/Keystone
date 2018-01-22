class UsersController < ApplicationController
  skip_before_action :current_user, only: [:new, :create]
  skip_before_action :require_logged_in, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:error] = @user.errors.full_messages
      redirect_to "/signup"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
