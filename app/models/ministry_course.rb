class MinistryCourse < ActiveRecord::Base
  belongs_to :ministryDoc
  has_many :ministryStrands, dependent: :destroy

end
