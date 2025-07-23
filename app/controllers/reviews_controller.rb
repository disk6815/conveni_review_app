class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @reviews = Review.includes(:user)
  end

  def show
    @review = Review.find(params[:id])
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
    @review = current_user.reviews.find(params[:id])
    @review_form = ReviewForm.from_review(@review)
  end

  def update
    @review = current_user.reviews.find(params[:id])
    @review_form = ReviewForm.from_review(@review)
    @review_form.assign_attributes(review_form_params)

    if @review_form.update
      redirect_to review_path(@review), notice: "更新に成功しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    redirect_to reviews_path, notice: "saccessfully deleted."
  end

  private

  def review_form_params
    params.require(:review_form).permit(:body, :rating, :product_id, :product_name, :price, :is_official, :conveniencestore_id, :category_id, :taste_id, :image)
  end
end
