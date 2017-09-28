class RatingCache < ApplicationRecord
  belongs_to :cacheable, :polymorphic => true
end
