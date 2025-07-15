class Taste < ApplicationRecord
  has_many :review_tastes
  has_many :reviews, through: :review_tastes
end
