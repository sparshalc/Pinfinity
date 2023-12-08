class AdminController < ApplicationController
  def dashboard
    @pin = Pin.all
    @board = Board.all
  end
end