class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def feed
    @pin = Pin.all.order("RANDOM()")
  end

  def home
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
