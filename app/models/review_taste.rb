class ReviewTaste < ApplicationRecord
  belongs_to :review
  belongs_to :taste

  validates :review_id, uniqueness: { scope: :taste_id }
end
