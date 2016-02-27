class AddClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.references(:user)
      t.references(:podcast)
      t.timestamps null: false
    end
  end
end
