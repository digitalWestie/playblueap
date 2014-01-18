class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :screen_name
      t.string :avatar_url
      t.string :twitter_id

      t.timestamps
    end
  end
end
