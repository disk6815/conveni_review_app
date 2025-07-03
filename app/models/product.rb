class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy # Productが削除されたら、関連するReviewも削除される

  validates :name, presence: true
end
