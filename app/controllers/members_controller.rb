class MembersController < ApplicationController
  def edit_description; end
  def update_description
          @user = current_user
          respond_to do |format|
          if @user.update(user_personal_info_params)
              format.turbo_stream
          end
      end
  end
  private
  def user_personal_info_params
      params.require(:user).permit(:image, :description)
  end
end