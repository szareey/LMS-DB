# == Schema Information
#
# Table name: user_tokens
#
#  id         :integer          not null, primary key
#  token      :string(255)
#  expires_at :datetime
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe User::Token, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
