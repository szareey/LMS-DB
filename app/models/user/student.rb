# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  email       :string
#  type        :string
#  created_at  :datetime
#  updated_at  :datetime
#  image_url   :string
#  gid         :string
#  is_approved :boolean
#  is_admin    :boolean
#

class User::Student < User
  has_many :answers
  has_many :user_relationships,
    foreign_key: :user1_id

    # Need to fix siblings so they can refer to one another. Right now it's only one way. http://collectiveidea.com/blog/archives/2015/07/30/bi-directional-and-self-referential-associations-in-rails/
  has_many :siblings,
    class_name: 'User::Student',
    through: :user_relationships,
    foreign_key: :user2_id,
    source: :sibling

  has_many :guardians, 
    class_name: 'User::Guardian', 
    through: :user_relationships
end
