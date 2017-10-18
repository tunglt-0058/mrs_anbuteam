class FavoriteReview < ApplicationRecord
  belongs_to :user
  belongs_to :review
end
