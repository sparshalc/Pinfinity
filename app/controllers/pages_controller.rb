class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @pin = Pin.all
  end

  def profile
    @user = User.find(params[:id])
    @board = @user.boards.public_board
  end
end
