class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale]
    # || I18n.default_locale
  end

  def default_url_options(options={})
    if user_signed_in?
      { :locale => current_user.profile.locale }
     else
      { :locale => I18n.default_locale }
     end
   end

end
