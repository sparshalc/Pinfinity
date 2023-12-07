module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "partials/flash"
  end

  def active_link(active_controller, active_class, not_active, active_action="index")
    if params[:controller] == "#{active_controller}" && params[:action] == "#{active_action}"
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
      "https://www.thespian.hr/assets/svg/logo-8a266154734a6b2b1a509c96923a771321bbf06a301daa52285428912dbecd5e.svg"
    end
  end
end
