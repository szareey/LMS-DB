# == Schema Information
#
# Table name: ministry_doc_overalls
#
#  id          :integer          not null, primary key
#  strand_id   :integer
#  part        :string(255)
#  description :string(255)
#  shorthand   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class MinistryDoc::Overall < ActiveRecord::Base
  
  belongs_to :strand
  has_many :specifics

end
