class MinistrySpecific < ActiveRecord::Base
  
  belongs_to :ministry_overall
  has_and_belongs_to_many :questions
  has_and_belongs_to_many :lessons

  delegate :ministry_strand, to: :ministry_overall
  delegate :ministry_course, to: :ministry_strand

  # returns strand part along with spec part (eg. "B: 2.1")
  def part_with_strand
    self.ministry_strand.part + ': ' + self.part
  end

end