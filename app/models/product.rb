class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy # Productが削除されたら、関連するReviewも削除される
  belongs_to :conveniencestore

  validates :name, presence: true
end
