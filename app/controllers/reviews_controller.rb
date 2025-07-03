class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @reviews = Review.includes(:user)
  end

  def show
  end

  def new
    @review_form = Review.new
  end

  def create
    @review_form = current_user.reviews.build(review_forms_params)
    @review_form.user_id = current_user.id
    if @review_form.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_forms_params
    params.require(:review_form).permit(:bod, :rating, :user_id, :product_id, :name, :price, :is_official)
  end
end
