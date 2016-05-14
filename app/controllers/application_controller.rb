class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate
    if current_user.nil?
      flash[:notice] = 'You must be sigined in to do that'
      redirect_to signup_url
    end
  end

  def current_access_token
    token = cookies.permanent.signed[:access_token]
    if token
      @current_access_token = AccessToken.where(token: token).first
    end
  end

  def current_user
    if current_access_token
      @current_user = User.find(@current_access_token.user_id)
    end
  end
end
