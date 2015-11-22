  # create_table "course_outlines", force: :cascade do |t|
  #   t.integer  "course_id"
  #   t.date     "year"
  #   t.integer  "semester"
  #   t.date     "development_date"
  #   t.date     "revision_date"
  #   t.string   "developer"
  #   t.string   "teacher"
  #   t.string   "reviser"
  #   t.string   "school"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"

class CourseOutlinesController < ApplicationController
  def index
    @outlines = CourseOutline.all
  end

  def show
    @course = MinistryDoc::Course.find_by(code: params[:id])
    @outline = CourseOutline.find_by(course: @course)
  end

  def new
    date_today = Date.today
    school = "Nancy Campbell Academy"
    teacher_fullname = @current_user.first_name + " " + @current_user.last_name
    # Guesses which semester the user is creating the outline for
    if date_today.month < 4 || date_today.month > 10
      current_semester = 2
    else
      current_semester = 1
    end

    # TODO: Figure out how to handle development date.
    @outline = CourseOutline.new(
      year: date_today.year,
      semester: current_semester,
      revision_date: date_today,
      development_date: date_today,
      developer: teacher_fullname,
      teacher: teacher_fullname,
      reviser: teacher_fullname,
      school: school
      )
  end

end