class MinistryOverall < ActiveRecord::Base
  belongs_to :ministry_course
  has_many :ministry_specifics

end
