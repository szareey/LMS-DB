class LessonsController < ApplicationController

  before_action :permission, only: [:destroy, :create, :new]

  def new
    @lesson = Lesson.new
  end

end