class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy # Productが削除されたら、関連するReviewも削除される
  belongs_to :conveniencestore

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
