class CommentNotification < Noticed::Base
  deliver_by :database

  def comment
    params[:message]
  end

  def creator
    comment&.user
  end

  def pin
    comment&.pin
  end

  def url 
    pin_path(params[:pin])
  end
end