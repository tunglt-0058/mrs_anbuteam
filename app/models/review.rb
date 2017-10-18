class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :comments, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :likes, -> {where activity_type: :like}, class_name: Activity.name
  has_many :dislikes, -> {where activity_type: :dislike}, class_name: Activity.name
  has_many :favorite_reviews
  has_many :users, :through => :favorite_reviews, :dependent => :destroy

  def main_comments
    comments.where(parent_id: nil).order id: :desc
  end

  def activity_by_user user
    activities.find_by user: user
  end

  class << self
    def top_reviews
      review_ids = Activity.where(activity_type: :like).group(:review_id).
        order("COUNT(review_id)").pluck :review_id
      review_ids += pluck(:id) if review_ids.empty?
      where id: review_ids.uniq
    end
  end
end
