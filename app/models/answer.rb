class Answer < ActiveRecord::Base

  belongs_to :student, class_name: 'Student', foreign_key: 'user_id'
  belongs_to :question

end
