class MinistryDoc < ActiveRecord::Base

  has_many :ministry_courses, dependent: :destroy

end
