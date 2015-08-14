# == Schema Information
#
# Table name: ministry_courses
#
#  id              :integer          not null, primary key
#  ministry_doc_id :integer
#  grade           :string(255)
#  title           :string(255)
#  description     :string(255)
#  code            :string(255)
#  pre_req         :string(255)
#  level           :string(255)
#  credit_value    :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class MinistryCourse < ActiveRecord::Base
  
  belongs_to :ministry_doc
  has_many :ministry_strands, dependent: :destroy

  def to_param
    code
  end

end
