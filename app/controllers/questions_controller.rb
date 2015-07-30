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
  end

  def create
    @question = Question.create(question_params)
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
    params.require(:question).permit(:question)
  end

end
