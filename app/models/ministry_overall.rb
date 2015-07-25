class MinistryOverall < ActiveRecord::Base
  belongs_to :ministryCourse
  has_many :ministrySpecifics

end
