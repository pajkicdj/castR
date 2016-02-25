class AddImage < ActiveRecord::Migration
  def change
    add_column :users, :image, :string, default: '/images/avatar.png'
  end
end
