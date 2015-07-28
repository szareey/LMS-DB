class LessonsController < ApplicationController

  # before_action :permission, only: [:new]

  def new
    @lesson = Lesson.new
    @course = MinistryCourse.first
  end

  def create
   # Lesson.create(
   #    user_id: params[:user_id],
   #    question_id: params[:question_id],
   #    answer: params[:solution],
   #    final_answer_img: params[:final_answer_img],
   #    audio: params[:audio]
   #    )

    redirect_to :back
  end

end