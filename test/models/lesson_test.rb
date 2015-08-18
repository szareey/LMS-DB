# == Schema Information
#
# Table name: lessons
#
#  id                   :integer          not null, primary key
#  ministry_specific_id :integer
#  teacher_id           :integer
#  lesson               :string(255)
#  title                :string(255)
#  difficulty           :string(255)
#  audio_file_name      :string(255)
#  audio_content_type   :string(255)
#  audio_file_size      :integer
#  audio_updated_at     :datetime
#  homework             :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
