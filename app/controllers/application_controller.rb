class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :check_read
  protect_from_forgery with: :exception
  after_filter :prepare_unobtrusive_flash
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
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
