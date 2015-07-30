class MinistryStrand < ActiveRecord::Base
  belongs_to :ministry_course
  has_many :ministry_overalls, dependent: :destroy

end
