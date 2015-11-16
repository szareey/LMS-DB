class CourseOutlinesController < ApplicationController
  def index
    @outlines = CourseOutline.all
  end

  def show
    @course = MinistryDoc::Course.find_by(code: params[:id])
    @outline = CourseOutline.find_by(course: @course)
  end

  def new
    @outline = CourseOutline.new
  end

end