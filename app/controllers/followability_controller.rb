class FollowabilityController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show; end

  def follow
    current_user.send_follow_request_to(@user)
    ActionCable.server.broadcast 'followers_count', { follow: @user.follow_requests, following_user: current_user, user: @user.id, message: 'requested to follow you' }
    redirect_to request.referrer
  end

  def unfollow
    make_it_a_unfriend_request

    current_user.unfollow(@user)
    redirect_to request.referrer
  end

  def accept
    current_user.accept_follow_request_of(@user)
    make_it_a_friend_request
    redirect_to request.referrer, notice: 'Follow requested accepted'
  end

  def decline
    current_user.decline_follow_request_of(@user)
    redirect_to request.referrer, alert: 'Follow requested declined'
  end

  def cancel
    current_user.remove_follow_request_for(@user)
    ActionCable.server.broadcast 'followers_count', { follow: @user.follow_requests, following_user: current_user, user: @user.id, message: 'canceled the request'  }
    redirect_to request.referrer
  end

  private

  def make_it_a_friend_request
    current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(current_user)
  end

  def make_it_a_unfriend_request
    @user.unfollow(current_user) if @user.mutual_following_with?(current_user)
  end

  def set_user
    @user = User.find(params[:id])
  end
end