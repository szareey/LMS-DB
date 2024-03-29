class AnswersController < ApplicationController
  def index
    @answer = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    unless @answer = Answer.find_by(question_id: params[:question_id], student_id: current_user.id)
      @answer = Answer.new
      @answer.question = Question.find(params[:question_id])
    end
  end

  def update
    Answer.find(params[:id]).update(
      score: params[:answer][:score],
      teacher_comment: params[:answer][:teacher_comment]
      )
    if request.xhr?
      render nothing: true
    else
      redirect_to :back
    end
  end

  def create
    #byebug
    Answer.create(
      student_id: current_user.id,
      question_id: params[:question_id],
      answer: params[:solution],
      final_answer_img: params[:final_answer_img],
      audio: params[:audio]
      )

    redirect_to :back
  end
end
