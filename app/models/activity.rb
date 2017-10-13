class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :review

  enum activity_type: [:like, :dislike]
end
