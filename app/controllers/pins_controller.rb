class PinsController < ApplicationController

  def new
    @pin = Pin.new
    @board = Board.find_by(id: params[:board_id])
  end
  
  def create
    @board = Board.find_by(id: params[:board_id])
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
  
  private
  
  def pins_params
    params.require(:pin).permit(:image)
  end
end
