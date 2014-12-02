class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @user = current_user
    @profile = Profile.new(user: @user)
  end
  
  def create
    @user = current_user
    @profile = Profile.new(user: @user)
    @profile.attributes = profile_params
    
    if @profile.save
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
    @user = current_user
    @profile = @user.profile
  end
  
  def update
    @user = current_user
    @profile = @user.profile
    
    if @profile.update(profile_params)
      redirect_to @user
    else
      render :new
    end
  end
  
  private
  
  def profile_params
    params.require(:profile).permit(:name, :location, :bio)
  end
end
