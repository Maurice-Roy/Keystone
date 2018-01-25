class UsersController < ApplicationController
  skip_before_action :current_user, only: [:new, :create]
  skip_before_action :require_logged_in, only: [:new, :create]
  def new
    if logged_in?
      redirect_to '/'
    else
      @user = User.new
      @disable_nav = true
    end
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

  def analytics
    @most_city_architectures = City.most_architectures
    @most_reviwed_architecture = Architecture.most_reviewed
    @architecture_highest_rated = Review.highest_rated
    @architecture_lowest_rated = Review.lowest_rated
    @review_average_length = Review.average_content_rating
    @average_review_rating = Review.average_rated
    @highest_number_of_reviews = User.highest_number_of_reviews
    @users_average_review_count = User.average_number_of_reviews
    # @city_with_highest_avg_reviews = City.highest_reviewed_architecture
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
