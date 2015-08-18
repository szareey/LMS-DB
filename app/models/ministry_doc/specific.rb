# == Schema Information
#
# Table name: ministry_doc_specifics
#
#  id          :integer          not null, primary key
#  overall_id  :integer
#  part        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class MinistryDoc::Specific < ActiveRecord::Base
  
  belongs_to :overall
  has_and_belongs_to_many :questions, class_name: '::Question'
  has_and_belongs_to_many :lessons, class_name: '::Lesson'

  delegate :strand, to: :overall
  delegate :course, to: :strand

  # returns strand part along with spec part (eg. "B: 2.1")
  def part_with_strand
    self.strand.part + ': ' + self.part
  end

end
