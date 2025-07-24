class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show by_nationality]
  before_action :set_review, only: %i[edit update destroy]

  def index
    @reviews = Review.includes(:user).order(updated_at: :desc)
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
      redirect_to reviews_path, notice: t('flash.reviews.create')
    else
      flash.now[:alert] = t('flash.reviews.danger.create')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review_form = ReviewForm.from_review(@review)
  end

  def update
    @review_form = ReviewForm.from_review(@review)
    @review_form.assign_attributes(review_form_params)

    if @review_form.update
      redirect_to review_path(@review), notice: t('flash.reviews.update')
    else
      flash.now[:alert] = t('flash.reviews.danger.update')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @review.destroy
      redirect_to reviews_path, notice: t('flash.reviews.destroy')
    else
      flash.now[:alert] = t('flash.reviews.danger.destroy')
      render :show, status: :unprocessable_entity
    end
  end

  def by_nationality
    @nationality = params[:code] # ここでparams[:code]を取得
    @reviews = Review.joins(:user).where(users: { nationality: @nationality }).order(updated_at: :desc)
    render :index 
  end

  private

  def review_form_params
    params.require(:review_form).permit(:body, :rating, :product_id, :product_name, :price, :is_official, :conveniencestore_id, :category_id, :taste_id, :image)
  end

  def set_review
    @review = current_user.reviews.find(params[:id])
  end  
end
