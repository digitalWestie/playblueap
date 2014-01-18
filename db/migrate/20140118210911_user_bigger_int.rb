class UserBiggerInt < ActiveRecord::Migration
  def up
    change_column :actions, :twitter_user_id, :integer, :limit => 8
    change_column :actions, :tweet_id, :integer, :limit => 8
    change_column :users, :twitter_id, :integer, :limit => 8
  end

  def down
  end
end
