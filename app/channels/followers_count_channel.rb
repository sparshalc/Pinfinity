class FollowersCountChannel < ApplicationCable::Channel
  def subscribed
    stream_from "followers_count"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
