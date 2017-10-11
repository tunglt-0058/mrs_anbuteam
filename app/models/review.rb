class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :comments, dependent: :destroy

  def main_comments
    comments.where(parent_id: nil).order id: :desc
  end
end
