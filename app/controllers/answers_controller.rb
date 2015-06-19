class AnswersController < ApplicationController

def index
  @answer = Answer.all
end

def show
  @answer = Answer.find(params[:id])
end

def new
  @question = Question.find(params[:question_id])
  # For main canvas for creating a new answer
end

def create

  Answer.create(
    user_id: params[:user_id],
    question_id: params[:question_id],
    answer: params[:solution]
    )

  redirect_to :back
end

end
