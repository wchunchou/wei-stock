class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend_id])
    @friendship = Friendship.create(user: current_user, friend_id: params[:friend_id])
    # current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "You follows #{friend.full_name } "
    else
      flash[:alert] = "something goes wrong "
    end
    
    redirect_to my_friendlist_path
  end

  def destroy
    friend = User.find(params[:id])
    friendship = current_user.friendships.where( friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "You unfollowed #{friend.full_name } "
    redirect_to my_friendlist_path
  end
end
