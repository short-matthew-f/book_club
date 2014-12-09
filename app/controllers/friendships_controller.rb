class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends
  end
  
  def create
    @user = User.find(params[:user_id])
    @user.befriend(current_user)
    
    redirect_to @user
  end
  
  def destroy
    @friendship = Friendship.find(params[:id])
    @user = @friendship.user
    @user.defriend(current_user)
    
    redirect_to @user
  end
end
