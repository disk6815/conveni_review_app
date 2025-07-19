class ReviewForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :review

  # 属性の定義
  attribute :body, :string
  attribute :rating, :float
  attribute :user_id, :integer
  attribute :product_id, :integer
  attribute :product_name, :string
  attribute :price, :integer
  attribute :is_official, :boolean, default: false
  attribute :conveniencestore_id, :integer
  attribute :category_id
  attribute :taste_id

  validates :body, presence: true, length: { maximum: 500 }
  validates :product_name, presence: true

  def save
    return false if invalid?

    product = Product.create(
      name: product_name,
      price: price,
      is_official: is_official,
      conveniencestore_id: conveniencestore_id
    )

   review = Review.create(
      body: body,
      rating: rating.to_i,
      user_id: user_id,
      product_id: product.id,
    )

    ReviewCategory.create(
      review_id: review.id,
      category_id: category_id
    ) if category_id.present?

    ReviewTaste.create(
      review_id: review.id,
      taste_id: taste_id
    ) if taste_id.present?

    true
  end

  def self.from_review(review)
    form = new(
      user_id: review.user_id,
      product_id: review.product_id,
      product_name: review.product.name,
      price: review.product.price,
      is_official: review.product.is_official,
      conveniencestore_id: review.product.conveniencestore_id,
      category_id: review.categories.present? ? review.categories.first.id : nil,
      taste_id: review.tastes.present? ? review.tastes.first.id : nil,
      rating: review.rating,
      body: review.body
    )
    form.review = review # ← インスタンス変数に代入
    form
  end

  def update
    ActiveRecord::Base.transaction do
      # Productの更新
      product = review.product
      product.update!(
        name: product_name,
        price: price.presence,
        is_official: is_official,
        conveniencestore_id: conveniencestore_id
      )

      # Reviewの更新
      review.update!(
        body: body,
        rating: rating.to_i
      )

      # 中間テーブルの更新（先に全部削除してから再追加）
      review.review_categories.destroy_all
      review.review_tastes.destroy_all

      review.categories << Category.find(category_id) if category_id.present?
      review.tastes << Taste.find(taste_id) if taste_id.present?
    end
    true
    rescue => e
      errors.add(:base, e.message)
      false
  end
end
