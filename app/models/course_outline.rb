class CourseOutline < ActiveRecord::Base
  belongs_to :course, 
             :class_name => "MinistryDoc::Course"
end
