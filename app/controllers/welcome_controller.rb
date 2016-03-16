class WelcomeController < ApplicationController
  def index
  end

  def addfriend
    @user = User.all
  end

  def profile
    @user = current_user
  end
end
