class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  
  def show
    @group = Group.find(params[:id])
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, success: 'グループを作成しました'
    else
      flash.now[:danger] = 'グループを作成できませんでした'
      render :new
    end
  end
  
  def update
    if @group.update(group_params)
      redirect_to root_path, success: 'グループを更新しました'
    else
      flash.now[:danger] = "グループを更新できませんでした"
      render :edit
    end
  end
  
  private
  def group_params
    params.require(:group).permit(:name, :user_id)
  end
end
