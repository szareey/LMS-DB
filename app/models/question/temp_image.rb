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

class Question::TempImage < ActiveRecord::Base
  has_attached_file :image
  do_not_validate_attachment_file_type :image
end
