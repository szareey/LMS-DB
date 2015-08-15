class QuestionsController < ApplicationController

  before_action :permission, only: [:destroy, :create, :new]

  def index
    # TODO: will need to update eventually to only include lessons and questions that are part of a course
    @questions = Question.all
    @lessons = Lesson.all
    @user_answers = Answer.find_by(user_id: @current_user.id)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    @course = MinistryCourse.find_by(code: 'MPM1D')
  end

  def create
    @question = Question.new(question_params)
    @question.teacher = @current_user
    @question.ministry_specifics = question_specifics
    @question.save
    redirect_to :questions
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to :questions
  end

  protected

  def permission
    redirect_to :back unless @current_user.type == 'Teacher'
  end

  def question_params
    params.require(:question).permit(
      :question, 
      :knowledge, 
      :thinking, 
      :communication, 
      :application, 
      :description, 
      :answer_has_audio, 
      :question_has_audio, 
      :marks)
  end

  def question_specifics
    # TODO: Don't know if there's a way to remove the empty element from array. Seems to be a rails issue.
    MinistrySpecific.find params.require(:question).require(:ministry_specifics).reject(&:empty?)
  end

end
