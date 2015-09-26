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

FactoryGirl.define do
  factory :user_token, :class => 'User::Token' do
    token "MyString"
expires_at "2015-09-09 16:00:52"
user nil
  end

end
