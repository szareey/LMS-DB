# == Schema Information
#
# Table name: answers
#
#  id                            :integer          not null, primary key
#  user_id                       :integer
#  question_id                   :integer
#  answer                        :string(255)
#  created_at                    :datetime
#  updated_at                    :datetime
#  teacher_comment               :string(255)
#  score                         :integer
#  request_meeting               :boolean          default(FALSE)
#  final_answer_img_file_name    :string(255)
#  final_answer_img_content_type :string(255)
#  final_answer_img_file_size    :integer
#  final_answer_img_updated_at   :datetime
#  audio_file_name               :string(255)
#  audio_content_type            :string(255)
#  audio_file_size               :integer
#  audio_updated_at              :datetime
#

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
