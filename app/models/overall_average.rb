class OverallAverage < ApplicationRecord
  belongs_to :rateable, :polymorphic => true
end
