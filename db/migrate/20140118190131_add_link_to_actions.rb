class AddLinkToActions < ActiveRecord::Migration
  def change
    add_column :actions, :link, :string
  end
end
