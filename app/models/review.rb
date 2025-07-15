class Review < ApplicationRecord
  has_many :review_categories, dependent: :destroy
  has_many :categories, through: :review_categories
  has_many :review_tastes, dependent: :destroy
  has_many :tastes, through: :review_tastes
  belongs_to :user
  belongs_to :product

  validates :body, presence: true, length: { maximum: 500 }
end
