class NotificationService
  attr_reader :args

  def initialize args
    @notification = args[:notification]
    @movie = args[:movie]
    @review = args[:review]
    @channel = args[:channel]
  end

  def perform
    NotificationJob.perform_now channel: @channel, notification: @notification,
      review: @review , movie: @movie
  end
end
