class AuthenticationsController < ApplicationController
  before_filter :authenticate_user!
  
  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to profile_url, :notice => t(:destroy_authentication_notice)
  end
end
