class MessageCountChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_count"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
