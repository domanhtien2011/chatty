class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :check_read
  helper_method :current_user, :user_signed_in?
  protect_from_forgery with: :exception
  after_filter :prepare_unobtrusive_flash

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !!current_user
  end

  def require_login
    if !user_signed_in?
      flash[:danger] = 'You must be logged in to see this page'
      redirect_to login_path
    end
  end

  def skip_if_logged_in
    if user_signed_in?
      flash[:warning] = "You already signed in"
      redirect_to users_path
    end
  end


  def check_recipient
    if user_signed_in?
      @message = Message.find(params[:id])
      if current_user.id != @message.recipient_id
        redirect_to welcome_index_path
        flash[:danger] = "You don't have the permission to see this message"
      end
    end
  end

  def check_read
    @message = Message.find(params[:id])
    @message.update_columns(read: true)
    # redirect_to inbox_path if @message.read == true
    # flash[:danger] = 'You have already read this message'
  end

  def read_once(message)
    if current_user.id == message.recipient_id && message.read == true
      redirect_to welcome_profile_url
      flash[:danger] = 'You could read this message only once!'
    end
  end
end
