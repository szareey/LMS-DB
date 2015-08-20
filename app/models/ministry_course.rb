class MinistryCourse < ActiveRecord::Base
  
  belongs_to :ministry_doc
  has_many :ministry_strands, dependent: :destroy

  has_many :ministry_overalls, through: :ministry_strands
  has_many :ministry_specifics, through: :ministry_overalls


  def to_param
    code
  end

  def all_spec_parts
    self.ministry_specifics.map &:part
  end

end