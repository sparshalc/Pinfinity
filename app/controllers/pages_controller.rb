class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def feed
    @pin = Pin.all.order("RANDOM()")
  end

  def home
  end

  def notifications
    if current_user
      @notifications = current_user.notifications.all.order('Created_at DESC')
      current_user.notifications.mark_as_read!
    end
  end

  def profile
    @user = User.find(params[:id])
    if current_user.id == @user.id
      @board = @user.boards.all
    else
      @board = @user.boards.public_board
    end
  end
end
