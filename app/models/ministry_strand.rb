# == Schema Information
#
# Table name: ministry_strands
#
#  id                 :integer          not null, primary key
#  ministry_course_id :integer
#  part               :string(255)
#  title              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class MinistryStrand < ActiveRecord::Base
  
  belongs_to :ministry_course
  has_many :ministry_overalls, dependent: :destroy
  has_many :ministry_specifics, through: :ministry_overalls

end
