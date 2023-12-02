class CommentCountChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comment_count_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
