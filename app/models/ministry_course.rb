class MinistryCourse < ActiveRecord::Base
  
  belongs_to :ministry_doc
  has_many :ministry_strands, dependent: :destroy

  def to_param
    code
  end

end
