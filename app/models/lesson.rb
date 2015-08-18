# == Schema Information
#
# Table name: lessons
#
#  id                   :integer          not null, primary key
#  ministry_specific_id :integer
#  user_id              :integer
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

class Lesson < ActiveRecord::Base
  has_attached_file :audio
  do_not_validate_attachment_file_type :audio

  has_and_belongs_to_many :ministry_specifics, 
                          class_name: 'MinistryDoc::Specific'
  belongs_to :teacher, class_name: 'User::Teacher'
end
