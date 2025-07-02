class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product, optional: true # product_idがnullでも許容する

  validates :body, presence: true, length: { maximum: 500 }
end
