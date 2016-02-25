class AddImage < ActiveRecord::Migration
  def change
    add_column :users, :image, :string, default: '/public/images/avatar.png'
  end
end
