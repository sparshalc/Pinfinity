class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :pin

  has_noticed_notifications

  after_create_commit { broadcast_notification }

  def broadcast_notification
    return if user == pin.user

    CommentNotification.with(message: self).deliver_later(pin.user)

    broadcast_prepend_to "notifications_#{pin.user.id}",
                          target: "notifications_#{pin.user.id}",
                          partial: 'notifications/notification',
                          locals: { user:, pin:, unread: true}

    ActionCable.server.broadcast 'notification_count', { pin_user: pin.user.id, user: user, notifications: pin.user.notifications.count, pin_id: pin.name }
  end
end
