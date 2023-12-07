class MembersController < ApplicationController
    before_action :verify_user, only: %i[followers following]
  def edit_description; end

  def update_description
          @user = current_user
          respond_to do |format|
          if @user.update(user_personal_info_params)
              format.turbo_stream
          end
      end
  end

  def notification_reqs
  end

  def followers
    @followers = @user.followers.all
  end

  def following
    @following = @user.following.all
  end
  private

  def verify_user
    @user = User.find(params[:id])
  end

  def user_personal_info_params
      params.require(:user).permit(:image, :description)
  end
end