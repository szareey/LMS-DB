# class CourseOutline::Content < ActiveRecord::Base
#   belongs_to :course_outline
#   # has_many :strands, dependent: :destroy

#   # has_many :overalls, through: :strands
#   # has_many :specifics, through: :overalls

# end
class CourseOutline::CourseContent < ActiveRecord::Base
  
  belongs_to :course_outline
  has_many :evaluations

end