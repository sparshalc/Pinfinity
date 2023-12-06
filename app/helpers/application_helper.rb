module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "partials/flash"
  end

  def active_link(active_controller, active_class, not_active)
    if params[:controller] == "#{active_controller}"
      "#{active_class}"
    else
      "#{not_active}"
    end
  end

  def verify_user(user, modal)
    modal.user.id == user.id
  end
  
  def user_image(user)
    if user.image.attached?
      user.image
    else
      "https://avatars.githubusercontent.com/u/3171503?s=200&v=4"
    end
  end
end
