module NotificationsHelper
  
  def notification_form(notification)
    @visitor = notification.visitor
    
    case notification.action
      when "add" then
        tag.a(notification.visitor.name, href: user_path(@visitor), style: "font-weight: bold;") + "があなたをグループに追加しました"
    end
  end
  
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
