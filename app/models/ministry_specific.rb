# == Schema Information
#
# Table name: ministry_specifics
#
#  id                  :integer          not null, primary key
#  ministry_overall_id :integer
#  part                :string(255)
#  description         :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

class MinistrySpecific < ActiveRecord::Base
  
  belongs_to :ministry_overall
  has_and_belongs_to_many :questions
  has_and_belongs_to_many :lessons

end
