class Review < ApplicationRecord
  after_create :send_notification

  belongs_to :user
  belongs_to :movie
  has_many :comments, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :likes, -> {where activity_type: :like}, class_name: Activity.name
  has_many :dislikes, -> {where activity_type: :dislike}, class_name: Activity.name
  has_many :favorite_reviews
  has_many :users, :through => :favorite_reviews, :dependent => :destroy
  has_many :notifications, dependent: :destroy

  default_scope -> {order created_at: :desc}

  after_save :update_movie_point

  def main_comments
    comments.where(parent_id: nil).order id: :desc
  end

  def activity_by_user user
    activities.find_by user: user
  end

  def update_movie_point
    movie.update_attributes point: movie.avarage_rate
  end

  class << self
    def top_reviews
      review_ids = Activity.where(activity_type: :like).group(:review_id).
        order("COUNT(review_id)").pluck :review_id
      review_ids += pluck(:id) if review_ids.empty?
      where id: review_ids.uniq
    end
  end

  private
  def send_notification
    self.movie.favorite_users.each do |user|
      notification = Notification.create! review_id: self.id, movie_id: self.movie_id,
        recipient_id: user.id
      channel = user.email + "_notification_channel"
      user.update_attributes new_notification: (user.new_notification + 1)
      NotificationService.new(channel: channel, review: notification.review,
        movie: notification.movie, notification: notification).perform
    end
  end
end
