class MinistrySpecific < ActiveRecord::Base
  belongs_to :ministryOveralls
  has_and_belongs_to_many :questions
end
