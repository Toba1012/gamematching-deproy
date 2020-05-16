module NotificationsHelper
  
  def notification_form(notification)
    @visiter = notification.visiter
    
    case notification.action
      when "add" then
        tag.a(notification.visiter.name, href: users_user_path(@visiter), style: "font-weight: bold;") + "があなたをグループに追加しました"
    end
  end
  
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
