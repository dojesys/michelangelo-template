class RegistrationsController < Devise::RegistrationsController
  
  def create
    super
    logger.debug "EN CREATE!"
    session[:omniauth] = nil unless @user.new_record?
  end

end
