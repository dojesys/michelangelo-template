module AuthenticationsHelper
  def authentication_user_id(provider, uid)
    if provider == 'google_apps'
      uid.split(/id=/)[1]
    else
      uid
    end    
  end
end
