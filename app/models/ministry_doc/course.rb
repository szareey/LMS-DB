# == Schema Information
#
# Table name: ministry_doc_courses
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

class MinistryDoc::Course < ActiveRecord::Base
  belongs_to :ministry_doc
  has_many :strands, dependent: :destroy

  has_many :overalls, through: :strands
  has_many :specifics, through: :overalls


  has_many :ministry_overalls, through: :ministry_strands
  has_many :ministry_specifics, through: :ministry_overalls


  def to_param
    code
  end

  def all_spec_parts
    self.specifics.map &:part
  end

end

# course.ministry_strands.inject do |specs, strand| {strand.map &:part}