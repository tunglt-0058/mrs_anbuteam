class SuggestMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :sender, class_name: User.name, foreign_key: :sender_id
  belongs_to :receiver, class_name: User.name, foreign_key: :receiver_id
  has_many :notifications, dependent: :destroy, as: :notiable

  after_create :send_notification

  private
  def send_notification
    self.movie.favorite_users.each do |user|
      notification = Notification.create! movie_id: self.movie_id,
        recipient_id: user.id, notiable_id: id,
        notiable_type: SuggestMovie.name
      channel = user.email + "_notification_channel"
      user.update_attributes new_notification: (user.new_notification + 1)
      NotificationService.new(channel: channel,
        movie: notification.movie, notification: notification).perform
    end
  end

  class << self
    def create_suggest_movie suggest_movies_params, movie, sender_id
      ActiveRecord::Base.transaction do
        receiver_ids = suggest_movies_params[:receiver_id].reject &:blank?
        @suggest_movies = []
        receiver_ids.each do |re_id|
          @suggest_movie = SuggestMovie.create! movie_id: movie.id,
            sender_id: sender_id, receiver_id: re_id,
            content: suggest_movies_params[:content]
          @suggest_movies.push @suggest_movie
        end
      end
      return @suggest_movies if @suggest_movie.save
      nil
    end
  end
end
