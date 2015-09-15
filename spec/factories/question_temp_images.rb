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

FactoryGirl.define do
  factory :question_temp_image, :class => 'Question::TempImage' do
    
  end

end
