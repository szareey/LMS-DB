class AnswersController < ApplicationController

def index
  @answer = Answer.all
end

def show
  @answer = Answer.find(params[:id])
end

def new
  unless @answer = Answer.find_by(question_id: params[:question_id], user_id: @current_user.id)
    @answer = Answer.new
    @answer.question = Question.find(params[:question_id])
  end
  # For main canvas for creating a new answer
end

def update
  Answer.find(params[:id]).update(
    score: params[:answer][:score],
    teacher_comment: params[:answer][:teacher_comment]
    )
  redirect_to :back
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
