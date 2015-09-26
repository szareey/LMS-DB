# == Schema Information
#
# Table name: ministry_doc_strands
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  part       :string
#  title      :string
#  created_at :datetime
#  updated_at :datetime
#

class MinistryDoc::Strand < ActiveRecord::Base
  
  belongs_to :course
  has_many :overalls, dependent: :destroy
  has_many :specifics, through: :overalls

end
