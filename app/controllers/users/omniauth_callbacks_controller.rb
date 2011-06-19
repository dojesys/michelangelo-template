class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)
    
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      profile = Profile.find(@user.profile.id)
      if profile
        profile.display_name = env['omniauth.auth']['extra']['user_hash']['name']
        profile.about = env['omniauth.auth']['extra']['user_hash']['bio']
        if env['omniauth.auth']['extra']['user_hash']['gender'] == 'male'
          profile.gender = 0
        else
          profile.gender = 1
        end        
        profile.save!
      end
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def open_id
    @user = User.find_for_open_id(env["omniauth.auth"], current_user)
    logger.debug "DATA!  #{env['omniauth.auth']}"
    
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Open Id"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.open:id_data"] = env["openid.ext1"]
      redirect_to new_user_registration_url
    end
  end

  def google_apps
    @user = User.find_for_google_apps(env["omniauth.auth"], current_user)
    
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      profile = Profile.find(@user.profile.id)
      if profile
        profile.display_name = env['omniauth.auth']['user_info']['name']
        profile.save!
      end

      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.open:id_data"] = env["openid.ext1"]
      redirect_to new_user_registration_url
    end
  end

end