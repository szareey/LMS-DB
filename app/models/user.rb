# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  type            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  image           :string(255)
#  gid             :string(255)
#

class User < ActiveRecord::Base
  has_one :token, class_name: 'User::Token'

  def teacher?
    type == 'User::Teacher'
  end

  def student?
    type == 'User::Student'
  end
end
