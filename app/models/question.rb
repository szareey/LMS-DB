class Question < ActiveRecord::Base

  has_attached_file :question, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  do_not_validate_attachment_file_type :question

  has_many :answers
  has_and_belongs_to_many :ministry_specifics
  belongs_to :teacher, class_name: 'Teacher', foreign_key: 'user_id'

end

