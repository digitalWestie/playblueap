class AddTwittertUserIdToActions < ActiveRecord::Migration
  def change
    add_column :actions, :twitter_user_id, :integer
  end
end
