class MinistryOverall < ActiveRecord::Base
  
  belongs_to :ministry_strand
  has_many :ministry_specifics

end
