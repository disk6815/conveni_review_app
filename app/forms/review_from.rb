class ReviewForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  # 属性の定義
  attribute :body, :string
  attribute :rating, :float
  attribute :user_id, :integer
  attribute :product_id, :integer
  attribute :name, :string
  attribute :price, :integer
  attribute :is_official, :boolean, default: false
  
  validates :body, presence: true, length: { maximum: 500 }
  validates :name, presence:true

  def save
    return false if invalid?

    product = Product.create!(
      name: name,
      price: price,
      is_official: is_official
    )

    Review.create!(
      body: body,
      rating: rating,
      user_id: user_id,
      product_id: product.id
    )
  end
end