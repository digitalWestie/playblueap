class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.integer :required_actions
      t.string :hashtag

      t.timestamps
    end
  end
end
