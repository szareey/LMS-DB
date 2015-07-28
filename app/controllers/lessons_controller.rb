class LessonsController < ApplicationController

  # before_action :permission, only: [:new]

  def new
    @lesson = Lesson.new
    @course = MinistryCourse.first
  end

end