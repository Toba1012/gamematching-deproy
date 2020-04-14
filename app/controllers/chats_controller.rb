class ChatsController < ApplicationController
  def new
    @group = Group.find_by(params[:group_id])
    @chat = Chat.new
  end
  
  def create
    @chat = current_user.chats.new(chat_params)
    
    if @chat.save
      redirect_to groups_path, success: '送信しました'
    else
      flash.now[:danger] = '送信に失敗しました'
      render :new
    end
  end
  
  private
  def chat_params
    params.require(:chat).permit(:content, :group_id, :user_id)
  end
end
