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
end
