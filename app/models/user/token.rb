# == Schema Information
#
# Table name: user_tokens
#
#  id            :integer          not null, primary key
#  token         :string
#  refresh_token :string
#  expires_at    :datetime
#  user_id       :integer
#

class User::Token < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
end
