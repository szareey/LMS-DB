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

class User < ActiveRecord::Base
  has_one :token, class_name: 'User::Token'
  has_one :address

  def teacher?
    type == 'User::Teacher'
  end

  def student?
    type == 'User::Student'
  end
end
