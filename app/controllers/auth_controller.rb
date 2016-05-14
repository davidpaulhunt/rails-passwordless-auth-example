class AuthController < ApplicationController
  before_action :set_auth_token, only: :update

  def new
  end

  def create
    if params[:email]
      @user = User.where(email: params[:email]).first
    else
      flash[:notice] = 'Missing param: email'
      return render :new
    end

    @auth_token = AuthToken.new(user: @user)
    if @auth_token.save
      flash[:notice] = 'You will receive a signin link shortly, thanks for being patient!'
      redirect_to root_url
    else
      flash[:notice] = 'There was a problem delivering your signin link, please try again'
      render :new
    end
  end

  def update
    @access_token = AccessToken.from_auth_token(@auth_token)
    if @access_token.save
      flash[:notice] = 'Welcome! You are all signed in'
      cookies.permanent.signed[:access_token] = @access_token.token
      redirect_to root_url
    else
      flash[:notice] = 'Oops there was an error generating your access token. Please try again'
      render :new
    end
  end

  def destroy
    @access_token = current_access_token
    cookies.delete(:access_token)
    if @access_token.expire!
      flash[:notice] = 'Successfully logged out!'
      redirect_to root_url
    else
      flash[:notice] = 'There was an error signing you out'
      redirect_to :back
    end
  end

  private

  def set_auth_token
    if !params[:token]
      raise ActionController::RoutingError.new('Not Found')
    end

    @auth_token = AuthToken.where(token: params[:token]).first
    if !@auth_token
      raise ActionController::RoutingError.new('Not Found')
    elsif @auth_token.expired?
      flash[:notice] = 'Token has expired. Please request a new signin link'
      redirect_to signin_url
    end
  end
end
