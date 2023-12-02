class PinsController < ApplicationController
  before_action :set_board, only: [:new, :show, :create, :destroy]
  before_action :correct_user, only: %i[ edit update destroy ]

  def new
    @pin = Pin.new
  end

  def show
    @pin = Pin.find(params[:id])
    @board = Board.find_by(id: params[:board_id])
    @comments = @pin.comments.all
  end

  def create
    @pin = @board.pins.new(pins_params)
    @pin.user = current_user
  
    respond_to do |format|
      if @pin.save
        format.turbo_stream
      else
        redirect_to root_path
      end
    end
  end

  def edit
    @pin = Pin.find(params[:id])
    @board = Board.find_by(id: params[:board_id])
  end

  def update
    @pin = Pin.find(params[:id])

    respond_to do |format|
      if @pin.update(pins_params)
        format.turbo_stream
      else
        render :edit
      end
    end
  end


  def destroy
    @pin = Pin.find(params[:id])
    @board = @pin.board  
  
    respond_to do |format|
      if @pin.destroy
        format.turbo_stream 
      else
        redirect_to root_path, alert: 'Failed to delete pin.'
      end
    end
  end
  
  
  private

  def set_board
    @board = Board.find_by(id: params[:board_id])
  end

  def correct_user
    @pin = current_user.pins.find_by(id: params[:id])
    redirect_to root_path,alert: "Only the admin of this pin can access this!" if @pin.nil?
  end
  
  def pins_params
    params.require(:pin).permit(:image, :name, :description)
  end
end
