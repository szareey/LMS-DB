class Lesson < ActiveRecord::Base

  has_attached_file :audio
  do_not_validate_attachment_file_type :audio

  has_and_belongs_to_many :ministrySpecifics
  belongs_to :teacher, class_name: 'Teacher', foreign_key: 'user_id'
  
end
