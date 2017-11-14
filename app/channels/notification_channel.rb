# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationChannel < ApplicationCable::Channel
  def subscribed
      channel_name = "#{current_user.email}_notification_channel"
      stream_from channel_name
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak data
    if data["action_type"] == "new_notification"
      current_user.update_attributes new_notification: 0
      if data["notification_id"] == "all"
        ActionCable.server.broadcast "#{current_user.email}_notification_channel",
          {notification_id: "all"}
      else
        current_user.notifications.find_by(id: data["notification_id"].to_i).update_attributes read: true
      end
    end
  end
end
