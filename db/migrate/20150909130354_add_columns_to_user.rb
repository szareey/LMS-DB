class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :string
    add_column :users, :gid, :string
    add_column :users, :is_approved, :boolean
  end
end
