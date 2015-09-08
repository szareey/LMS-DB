class QuestionsController < ApplicationController

  before_action :permission, only: [:destroy, :create, :new]
  def index
    # TODO: will need to update eventually to only include lessons and questions that are part of a course
    @questions = Question.all
    @lessons = Lesson.all
    @user_answers = Answer.find_by(student_id: current_user.id)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @questions = [Question.new]
    @course = MinistryDoc::Course.find_by(code: 'MPM1D')
  end

  def create
    @form = Question::BatchForm.new(
      question_params.merge(teacher: current_user)
    )
    
    @questions = @form.to_models
    @course = MinistryDoc::Course.find_by(code: 'MPM1D')
    if @form.save
      redirect_to :questions
    else
      render :new
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to :questions
  end

  protected

  def permission
    redirect_to :back unless current_user.teacher?
  end

  def question_params
    params.require(:question).permit(
      :knowledge, 
      :thinking, 
      :communication, 
      :application, 
      :description, 
      :answer_has_audio, 
      :question_has_audio,
      :marks,
      questions: [], 
      ministry_specific_ids: [])
  end
end
