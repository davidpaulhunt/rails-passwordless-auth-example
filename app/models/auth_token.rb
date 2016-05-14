class AuthToken < BaseToken
  expire_after 10.minutes

  self.table_name = :auth_tokens

  after_create :send_signin_link

  def send_signin_link
    AuthMailer.generate_signin_link(self).deliver_now
  end
end
