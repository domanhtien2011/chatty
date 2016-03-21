class MessagesController < ApplicationController
  before_action :check_recipient, only: [:show]
  before_action :require_login
  after_action :check_read, only: [:show]

  def index
  end

  def inbox
    @messages = Message.all
    @received_messages = Message.where(recipient_id: current_user.id).order('created_at DESC').page(params[:page]).per(5)
  end

  def sent_messages
    @messages = Message.all
    @sent_messages = Message.where(sender_id: current_user.id).order('created_at DESC').page(params[:page]).per(4)
  end

  def show
    @message = Message.find(params[:id])
    @message.update_columns(read_at: Time.now)
    read_once(@message)
    # just send one notification to the sender
    if @message.sent == nil
      ReadMailer.read_notification(@message).deliver
       @message.update_columns(sent: true)
    end

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
      redirect_to welcome_dashboard_path
    else
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :recipient_id, :user_id)
  end
end
