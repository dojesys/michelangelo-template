class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  
  def edit
    @profile = Profile.find_by_user_id(current_user.id)
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      redirect_to @profile, :notice  => t(:update_profile_notice)
    else
      render :action => 'edit'
    end
  end

end
