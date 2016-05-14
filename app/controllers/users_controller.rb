class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You will receive a signin link shortly, thanks for being patient!'
      redirect_to root_url
    else
      flash[:notice] = 'Oops there was an error signing you up'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
