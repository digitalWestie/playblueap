class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :hashtag
      t.integer :user_id
      t.integer :tweet_id
      t.text :body
      t.float :coefficient

      t.timestamps
    end
  end
end
