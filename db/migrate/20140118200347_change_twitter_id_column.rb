class ChangeTwitterIdColumn < ActiveRecord::Migration
  def up
    change_column :users, :twitter_id, :integer
  end

  def down
    change_column :users, :twitter_id, :string
  end
end
