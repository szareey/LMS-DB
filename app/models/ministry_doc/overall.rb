# == Schema Information
#
# Table name: ministry_doc_overalls
#
#  id          :integer          not null, primary key
#  strand_id   :integer
#  part        :string
#  description :string
#  shorthand   :string
#  created_at  :datetime
#  updated_at  :datetime
#

class MinistryDoc::Overall < ActiveRecord::Base
  
  belongs_to :strand
  has_many :specifics

end
