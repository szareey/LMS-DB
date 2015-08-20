# == Schema Information
#
# Table name: ministry_doc_strands
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  part       :string(255)
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class MinistryDoc::Strand < ActiveRecord::Base
  
  belongs_to :course
  has_many :overalls, dependent: :destroy
  has_many :specifics, through: :overalls

end
