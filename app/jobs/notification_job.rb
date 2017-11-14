class NotificationJob < ApplicationJob
  queue_as :default

  def perform args
    ActionCable.server.broadcast args[:channel], {notification: args[:notification],
      movie: args[:movie], review: args[:review]}
  end
end
