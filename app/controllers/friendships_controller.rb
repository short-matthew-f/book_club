class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends
    
    render 'users/friends'
  end
  
  def create
    @user = User.find(params[:user_id])
    
    current_user.befriend(@user)
    
    flash[:alert] = "Friend added!"
    
    redirect_to @user
  end
  
  def destroy
    @friendship = Friendship.find(params[:id])
    
    current_user.defriend(@friendship.user)
    
    flash[:alert] = "Friend removed!"
    
    redirect_to @friendship.user
  end
end
