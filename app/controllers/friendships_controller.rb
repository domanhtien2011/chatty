class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
      if @friendship.save
        flash[:success] = 'Successfully added friend'
        redirect_to welcome_profile_path
      else
        flash[:error] = "Unable to add friend"
        redirect_to root_path
      end
  end

  def destroy
    @friendship =current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:success] = 'Successfully removed friendship'
    redirect_to welcome_profile_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy)
    end
end
