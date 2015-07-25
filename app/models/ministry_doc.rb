class MinistryDoc < ActiveRecord::Base

  has_many :ministryCourses, dependent: :destroy

end
