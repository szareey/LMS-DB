class AnswersController < ApplicationController

def index
  @answer = Answer.all
end

def show
  @answer = Answer.find(params[:id])
end

def new
  @answer = Answer.new
  @question = Question.find(params[:question_id])
  # For main canvas for creating a new answer
end

end
