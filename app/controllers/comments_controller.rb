class CommentsController < ApplicationController

  def new
    @board = Board.find(params[:board_id])
    @pin = @board.pins.find(params[:pin_id])
    @comment = @pin.comments.new
  end

  def create
    @board = Board.find(params[:board_id])
    @pin = @board.pins.find(params[:pin_id])
    @comment = @pin.comments.new(comments_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
      ActionCable.server.broadcast 'comment_count_channel', {pin_id: @pin.id, comment: @pin.comments.count  }
        format.turbo_stream 
      else
        redirect_to root_path, alert: 'Failed to delete comment.'
      end
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @pin = @board.pins.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])

    respond_to do |format|
      if @comment.destroy
        ActionCable.server.broadcast 'comment_count_channel', {pin_id: @pin.id, comment: @pin.comments.count  }

        format.turbo_stream 
      else
        redirect_to root_path, alert: 'Failed to delete comment.'
      end
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:title)
  end
end
