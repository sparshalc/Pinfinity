class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def profile
    @user = User.find(params[:id])
    @board = @user.boards.public_board
  end
end
