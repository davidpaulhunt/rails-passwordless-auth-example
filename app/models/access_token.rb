class AccessToken < BaseToken
  expire_after 30.days

  self.table_name = :access_tokens

  def self.from_auth_token(auth_token)
    auth_token.expire!
    @access_token = AccessToken.new(user: auth_token.user)
  end
end
