class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    
    if @user == current_user && !@profile
      redirect_to new_profile_url
    else
      render :show
    end
  end
  
  def friends
    @users = current_user.friends
  end
  
  def find
    @user = User.find_by(email: params[:user][:email])
    
    if @user
      redirect_to @user
    else
      redirect_to request.referer
    end
  end
end
