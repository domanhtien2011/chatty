class SessionsController < ApplicationController
  before_action :skip_if_logged_in, only: [:new, :callback]

  def new

  end

  def callback()
    if user = User.from_omniauth(env["omniauth.auth"])
      # log in user here
      session[:user_id] = user.id
      flash[:success] = 'Facebook logged in successfully'
      redirect_to root_path
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Logged in successfully'
      redirect_to root_path
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have logged out'
    redirect_to root_path
  end
end
