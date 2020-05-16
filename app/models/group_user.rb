class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  has_many :notifications, dependent: :destroy
  
  def create_notification_by(current_user, user_id)
    notification = current_user.active_notifications.new(group_user_id: id, visited_id: user_id, action:"add")
    notification.save if notification.valid?
  end
end
