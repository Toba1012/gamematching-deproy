class GroupUsersController < ApplicationController
  def new
    @group_user = GroupUser.new
  end
  
  def create
    @group_user = current_user.group_users.new(group_user_params)
    
    if @group_user.save
      @group_user.create_notification_add!(current_user)
      redirect_to root_path, success: 'グループに追加しました'

    else
      flash.now[:danger] = 'グループに追加できませんでした'
      render :new
    end
  end
  
  private
  def group_user_params
    params.require(:group_user).permit(:group_id, :user_id)
  end
end