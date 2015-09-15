# == Schema Information
#
# Table name: ministry_doc_courses
#
#  id              :integer          not null, primary key
#  ministry_doc_id :integer
#  grade           :string
#  title           :string
#  description     :string
#  code            :string
#  pre_req         :string
#  level           :string
#  credit_value    :string
#  created_at      :datetime
#  updated_at      :datetime
#

class MinistryDoc::Course < ActiveRecord::Base
  belongs_to :ministry_doc
  has_many :strands, dependent: :destroy

  has_many :overalls, through: :strands
  has_many :specifics, through: :overalls

  def to_param
    code
  end

  def all_spec_parts
    self.specifics.map &:part
  end

end

# course.ministry_strands.inject do |specs, strand| {strand.map &:part}
