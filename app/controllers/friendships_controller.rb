class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def toggle_friendship
    @user = User.find(params[:user_id])
    if @user.friends.include? current_user
      @user.defriend(current_user)
      render json: { friend: false }
    else
      @user.befriend(current_user)
      render json: { friend: true }
    end
  end
end
