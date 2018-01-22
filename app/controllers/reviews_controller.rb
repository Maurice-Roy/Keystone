class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :destroy, :update]
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
    @architectures = Architecture.all
    @users = User.all
    @ratings = [5,4,3,2,1]
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      flash[:error] = @review.errors.full_messages
      redirect_to new_review_path
    end
  end

  def edit
    @architectures = Architecture.all
  end

  def update
    @review.update(review_params)
    if @review.valid?
      redirect_to review_path(@review)
    else
      redirect_to edit_review_path
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :architecture_id)
  end

end
