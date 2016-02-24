class AddLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references(:user)
      t.references(:podcast)
      t.timestamps null: false
    end
  end
end
