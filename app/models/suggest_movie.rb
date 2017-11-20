class SuggestMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :sender, class_name: User.name, foreign_key: :sender_id
  belongs_to :receiver, class_name: User.name, foreign_key: :receiver_id

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
