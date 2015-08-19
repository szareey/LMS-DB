# == Schema Information
#
# Table name: ministry_docs
#
#  id         :integer          not null, primary key
#  subject    :string(255)
#  grade9     :boolean
#  grade10    :boolean
#  grade11    :boolean
#  grade12    :boolean
#  province   :string(255)
#  year       :string(255)
#  title      :string(255)
#  URLpdf     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class MinistryDoc < ActiveRecord::Base

  has_many :ministry_courses, dependent: :destroy

end
