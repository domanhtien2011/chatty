class MessagesController < ApplicationController
  before_action :check_recipient, only: [:show]
  before_action :authenticate_user!
  after_action :check_read, only: [:show]

  def index
  end

  def inbox
    @messages = Message.all
    @received_messages = Message.where(recipient_id: current_user.id)
  end

  def sent_messages
    @messages = Message.all
    @sent_messages = Message.where(sender_id: current_user.id)
  end

  def show
    @message = Message.find(params[:id])
    @message.update_columns(read_at: Time.now)
    read_once(@message)
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
