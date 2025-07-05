class Review < ApplicationRecord
  has_many :review_categories
  has_many :categories, through: :review_categories
  belongs_to :user
  belongs_to :product

  validates :body, presence: true, length: { maximum: 500 }
end
