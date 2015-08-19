# == Schema Information
#
# Table name: ministry_overalls
#
#  id                 :integer          not null, primary key
#  ministry_strand_id :integer
#  part               :string(255)
#  description        :string(255)
#  shorthand          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class MinistryOverall < ActiveRecord::Base
  
  belongs_to :ministry_strand
  has_many :ministry_specifics

end
