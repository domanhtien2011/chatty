class RemoveFriendStatusFromFriendships < ActiveRecord::Migration
  def change
    remove_column :friendships, :friend_status, :boolean
  end
end
