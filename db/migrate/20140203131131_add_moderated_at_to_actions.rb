class AddModeratedAtToActions < ActiveRecord::Migration
  def change
    add_column :actions, :moderated_at, :timestamp
  end
end
