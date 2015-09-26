# == Schema Information
#
# Table name: question_temp_images
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Question::TempImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
