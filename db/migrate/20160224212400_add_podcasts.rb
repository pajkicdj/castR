class AddPodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.references(:playlist)
      t.string :title, limit: 2000
      t.string :url, limit: 2000
      t.timestamps null: false
    end
  end
end
