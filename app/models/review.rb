class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :comments, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :likes, -> {where activity_type: :like}, class_name: Activity.name
  has_many :dislikes, -> {where activity_type: :dislike}, class_name: Activity.name

  def main_comments
    comments.where(parent_id: nil).order id: :desc
  end

  def activity_by_user user
    activities.find_by user: user
  end
end
