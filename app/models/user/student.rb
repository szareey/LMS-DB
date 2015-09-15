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

end
