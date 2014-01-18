class AddScreenNameToActions < ActiveRecord::Migration
  def change
    add_column :actions, :screen_name, :string
  end
end
