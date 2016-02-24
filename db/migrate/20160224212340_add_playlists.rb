class AddPlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.references(:mood)
      t.string :title
      t.timestamps null: false
    end
  end
end
