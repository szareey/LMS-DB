Rails.application.config.middleware.use OmniAuth::Builder do
  scopes = [
    # we need the profile scope in order to login
    "https://www.googleapis.com/auth/userinfo.profile",
    "https://www.googleapis.com/auth/userinfo.email"
  ]
  provider :google_oauth2, 
            ENV["GOOGLE_CLIENT_ID"], 
            ENV["GOOGLE_CLIENT_SECRET"],
            { scope: scopes.join(" "), access_type: 'offline',  prompt: 'consent' }
end