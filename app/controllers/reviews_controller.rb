class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @reviews = Review.includes(:user)
  end

  def show
    @review = current_user.reviews.find(params[:id])
  end

  def new
    @review_form = ReviewForm.new
  end

  def create
    @review_form = ReviewForm.new(review_form_params)
    @review_form.user_id = current_user.id
    if @review_form.save
      redirect_to reviews_path
    else
      render :new, status: :unprocessable_entity
    end
    # puts @review_form.errors.full_messages
    # puts @review_form.params.inspect
  end

  def edit
  end

  def update
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    redirect_to reviews_path, notice: "saccessfully deleted."
  end

  private

  def review_form_params
    params.require(:review_form).permit(:body, :rating, :product_id, :product_name, :price, :is_official, :conveniencestore_id, :category_id, :taste_id)
  end
end
