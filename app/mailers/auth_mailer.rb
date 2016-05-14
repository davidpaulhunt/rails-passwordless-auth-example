class AuthMailer < ApplicationMailer
  def generate_signin_link(auth_token)
    @token = auth_token
    mail(to: @token.email)
  end
end
