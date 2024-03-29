# == Schema Information
#
# Table name: ministry_docs
#
#  id         :integer          not null, primary key
#  subject    :string
#  grade9     :boolean
#  grade10    :boolean
#  grade11    :boolean
#  grade12    :boolean
#  province   :string
#  year       :string
#  title      :string
#  URLpdf     :string
#  created_at :datetime
#  updated_at :datetime
#

class MinistryDoc < ActiveRecord::Base
  has_many :courses, 
           class_name: 'MinistryDoc::Course',
           dependent: :destroy
end
