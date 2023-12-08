class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    # is being used for stream
    @pin = @like.pin
      if @like.save
        respond_to do |format|
          format.turbo_stream
        end
      else
        redirect_to root_path, notice: 'Oops! Something went wrong'
      end
  end
  def destroy
      @like = current_user.likes.find(params[:id])
      @pin = @like.pin
      respond_to do |format| 
        if @like.destroy
          format.turbo_stream
        else
          redirect_to root_path,notice: 'Oops! Something went wrong'
        end
      end
  end
  private

  def like_params
      params.require(:like).permit(:pin_id)
  end
end
