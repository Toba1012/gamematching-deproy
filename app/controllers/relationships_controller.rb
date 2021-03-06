class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    following = current_user.follow(user)
    if following.save
      flash[:success] = 'フォローしました'
      redirect_to user
    else
      flash.now[:alert] = 'フォローに失敗しました'
      redirect_to user
    end
  end
  
  def destroy
    user = Relationship.find(params[:id]).followed
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = 'フォローを解除しました'
      redirect_to user
    else
      flash.now[:alert] = 'フォローの解除に失敗しました'
      redirect_to user
    end
  end
end
