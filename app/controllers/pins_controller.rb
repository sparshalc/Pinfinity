class PinsController < ApplicationController
  before_action :set_board, only: [:new, :details, :create, :destroy]

  def new
    @pin = Pin.new
  end

  def details
    @pin = Pin.find(params[:id])
    @board = Board.find_by(id: params[:board_id])
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
  
  def pins_params
    params.require(:pin).permit(:image, :name, :description)
  end
end
