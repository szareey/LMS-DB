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

class Answer < ActiveRecord::Base

  has_attached_file :final_answer_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :audio
  do_not_validate_attachment_file_type :final_answer_img
  do_not_validate_attachment_file_type :audio

  # validates_attachment_content_type :final_answer_img, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  # validates_attachment_file_name :final_answer_img, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

  belongs_to :student, class_name: 'User::Student'
  belongs_to :question


end
