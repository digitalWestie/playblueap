class RenameUsersPlayers < ActiveRecord::Migration
  def up
    rename_table :users, :players
    rename_column :actions, :user_id, :player_id
  end

  def down
    rename_table :players, :users
    rename_column :actions, :player_id, :user_id
  end
end
