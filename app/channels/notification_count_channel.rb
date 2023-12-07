class NotificationCountChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_count"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
