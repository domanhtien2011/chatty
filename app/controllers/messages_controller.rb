class MessagesController < ApplicationController
  before_action :check_recipient, only: [:show]
  before_action :require_login
  after_action :check_read, only: [:show]

  def index
  end

  def inbox
    @messages = Message.all
    @received_messages = Message.where(recipient_id: current_user.id).order('created_at DESC')
  end

  def sent_messages
    @messages = Message.all
    @sent_messages = Message.where(sender_id: current_user.id).order('created_at DESC')
  end

  def show
    @message = Message.find(params[:id])
    @message.update_columns(read_at: Time.now)
    read_once(@message)
    message_url = url_for :controller => 'messages', :action => 'show', :id => message.id, :email => false, :host => 'https://pure-gorge-59227.herokuapp.com/', :only_path => false
    ReadMailer.read_notification(@message).deliver
  end

  def new
    @message = Message.new
  end

  def finish

  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    if @message.save
      MessageMailer.notification(@message).deliver
      flash[:success] = 'Message sent successfully'
      redirect_to welcome_profile_path
    else
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :recipient_id, :user_id)
  end
end
