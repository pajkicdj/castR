class AddColumnsPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :image, :string
    add_column :playlists, :link, :string
    add_column :playlists, :description, :string
  end
end
