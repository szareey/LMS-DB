# == Schema Information
#   Table name "course_outlines"
#   integer  "course_id"
#   date     "year"
#   integer  "semester"
#   date     "development_date"
#   date     "revision_date"
#   string   "developer"
#   string   "teacher"
#   string   "reviser"
#   string   "school"
#   datetime "created_at"
#   datetime "updated_at"

class CourseOutline < ActiveRecord::Base
  belongs_to :course, 
             :class_name => "MinistryDoc::Course"

  has_many :course_contents,
           :class_name => "CourseOutline::CourseContent",
           dependent: :destroy

  delegate :ministry_doc, to: :course
  delegate :considerations, to: :ministry_doc
  delegate :teaching_stradegies, to: :ministry_doc
  
end
