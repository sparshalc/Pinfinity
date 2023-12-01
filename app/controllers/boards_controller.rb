class BoardsController < ApplicationController
  before_action :set_board, only: %i[ show edit update destroy ]
  before_action :correct_user, only: %i[ edit update destroy ]

  def show
    
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to board_url(@board), notice: "Board was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @board.update(board_params)
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @board.destroy!

    respond_to do |format|
      format.html { redirect_to boards_url, notice: "Board was successfully destroyed." }
    end
  end

  private
    def set_board
      @board = Board.find(params[:id])
    end

    def correct_user
      @board = current_user.boards.find_by(id: params[:id])
      redirect_to root_path,alert: "Only admin can access this!" if @board.nil?
    end

    def board_params
      params.require(:board).permit(:isPrivate, :name, :description, :image, :user_id)
    end
end
