class MinistryCoursesController < ApplicationController
  def index
    @courses = MinistryDoc::Course.all
  end

  def show
    @course = MinistryDoc::Course.find_by(code: params[:id])
  end
end