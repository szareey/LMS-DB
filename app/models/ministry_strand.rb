class MinistryStrand < ActiveRecord::Base
  
  belongs_to :ministry_course
  has_many :ministry_overalls, dependent: :destroy
  has_many :ministry_specifics, through: :ministry_overalls

end
