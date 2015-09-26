class User::Auth
  def self.auth_or_create(auth)
    credentials = auth['credentials']
    info = auth['info']

    if user = User.find_by(gid: auth['uid'])
      user.image_url = info['image']
    else
      user = User::Student.new(
        first_name: info['first_name'],
        last_name: info['last_name'],
        email: info['email'],
        image_url: info['image'],
        gid: auth['uid'],
        is_approved: false
      )
    end
    build_token(user, credentials)
    user.save!

    user
  end

  private

  def self.build_token(user, credentials)
    user.build_token(
      token: credentials['token'], 
      expires_at: Time.at(credentials['expires_at']),
      refresh_token: credentials['refresh_token']
    )
  end
end