class AnswersController < ApplicationController

def index
  if params[:teacher_id]
    @answers = Answer.find_by(question_id: params[:question_id]) 
    # render the teacher's view
  elsif params[:student_id]
  @answers = Answer.find_by(student_id: params[:student_id])
    # render the student's view
  end
end

def show
  @answer = Answer.find(params[:id])
end

def new
  @question = 
  # The main canvas for creating a new answer
end

end
