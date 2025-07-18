class Review < ApplicationRecord
  has_many :review_categories, dependent: :destroy
  has_many :categories, through: :review_categories
  has_many :review_tastes, dependent: :destroy
  has_many :tastes, through: :review_tastes
  belongs_to :user
  belongs_to :product

  validates :body, presence: true, length: { maximum: 500 }
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_nil: true
end
