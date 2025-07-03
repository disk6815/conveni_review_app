class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true, length: { maximum: 500 }
end
