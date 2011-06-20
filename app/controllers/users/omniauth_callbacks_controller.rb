class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    if current_user
      omniauth = env["omniauth.auth"]
      logger.debug "DATA #{omniauth}"
      
      authentication = current_user.authentications.find_or_create_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
      
      if authentication
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
        profile = Profile.find(current_user.profile.id)
        if profile
          # FIXME: Evaluar los unless con campos vacios
          profile.display_name = omniauth['extra']['user_info']['name'] unless profile.display_name
          profile.about = omniauth['extra']['user_hash']['description'] unless profile.about
          profile.location = omniauth['extra']['user_hash']['location'] unless profile.location
          profile.website = omniauth['extra']['user_hash']['url'] unless profile.website
          profile.save!
        end
        redirect_to root_url
      end
    end
  end

  def facebook
    @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)
    
    if @user.persisted?
      omniauth = env["omniauth.auth"]
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      profile = Profile.find(@user.profile.id)
      if profile
        profile.display_name = omniauth['extra']['user_hash']['name']
        profile.about = omniauth['extra']['user_hash']['bio']
        if omniauth['extra']['user_hash']['gender'] == 'male'
          profile.gender = 0
        else
          profile.gender = 1
        end        
        profile.save!
      end
      @user.authentications.find_or_create_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def google_apps
    @user = User.find_for_google_apps(env["omniauth.auth"], current_user)
    
    if @user.persisted?
      omniauth = env["omniauth.auth"]
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      profile = Profile.find(@user.profile.id)
      if profile
        profile.display_name = omniauth['user_info']['name']
        profile.save!
      end

      @user.authentications.find_or_create_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
      sign_in_and_redirect @user, :event => :authentication
    else
      # FIXME: Buscar datos correctos de google_apps
      session["devise.open:id_data"] = env["openid.ext1"]
      redirect_to new_user_registration_url
    end
  end

end