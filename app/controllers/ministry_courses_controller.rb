class MinistryCoursesController < ApplicationController
  def index
    @courses = MinistryCourse.all
  end

  def show
    @course = MinistryCourse.find_by(code: params[:id])
  end
end