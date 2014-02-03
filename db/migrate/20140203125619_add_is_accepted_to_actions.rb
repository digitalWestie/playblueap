class AddIsAcceptedToActions < ActiveRecord::Migration
  def change
    add_column :actions, :is_accepted, :boolean, :default => true
  end
end
