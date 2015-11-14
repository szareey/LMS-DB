class CourseOutline < ActiveRecord::Base
  belongs_to :course, 
             :class_name => "MinistryDoc::Course"

  has_many :contents,
           :class_name => "CourseOutline::CourseContent"
           dependent: :destroy

end
