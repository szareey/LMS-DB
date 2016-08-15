  #create_table "user_relationships", force: :cascade do |t|
  #   t.integer  "user1_id",     null: false
  #   t.integer  "user2_id",     null: false
  #   t.string   "relationship"
  #   t.datetime "created_at",   null: false
  #   t.datetime "updated_at",   null: false
  #end

class UserRelationship < ActiveRecord::Base
  belongs_to :student, 
    class_name: 'User::Student', 
    foreign_key: :user1_id

  belongs_to :guardian, 
    class_name: 'User::Guardian', 
    foreign_key: :user2_id

  belongs_to :sibling,
    class_name: 'User::Student',
    foreign_key: :user2_id
end
 