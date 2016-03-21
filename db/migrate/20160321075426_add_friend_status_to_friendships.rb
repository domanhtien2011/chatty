class AddFriendStatusToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :friend_status, :boolean
  end
end
