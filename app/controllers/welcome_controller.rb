class WelcomeController < ApplicationController
  def index
  end

  def addfriend
    @user = User.all
  end

  def profile
    @received_messages = Message.where(recipient_id: current_user.id, read: nil)
    @user = current_user
  end
end
