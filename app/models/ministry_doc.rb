class MinistryDoc < ActiveRecord::Base
  has_many :courses, 
           class_name: 'MinistryDoc::Course',
           dependent: :destroy
end