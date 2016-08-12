class CreateUserRelationships < ActiveRecord::Migration
  def change
    create_table :user_relationships do |t|
      t.integer "user1_id", :null => false
      t.integer "user2_id", :null => false
      t.string  "relationship"
      t.timestamps null: false
    end
  end
end
