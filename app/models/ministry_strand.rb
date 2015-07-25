class MinistryStrand < ActiveRecord::Base
  belongs_to :ministryCourse
  has_many :ministryOveralls, dependent: :destroy

end
