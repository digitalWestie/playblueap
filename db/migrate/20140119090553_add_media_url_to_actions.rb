class AddMediaUrlToActions < ActiveRecord::Migration
  def change
    add_column :actions, :video_url, :string
    add_column :actions, :photo_url, :string
  end
end
