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
    # q_params = question_params
    
    # # TODO: I don't know how to mass assign with the HABTM for ministry specifics. There has to be a better way to do this
    # specs = q_params.extract!(:ministry_specifics)
    # specs = specs.require(:ministry_specifics)
    
    # # TODO: figure out why the last element of my :ministry_specifics param is a blank. For now this removes it.
    # specs.pop
    # # reusing the specs variable to store MinstrySpecific objects
    # specs = MinistrySpecific.find specs

    @question = Question.new(params.require(:question))
      # teacher: @current_user,
      # ministry_specifics: specs,
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
      # {ministry_specifics: []})
  end

end
