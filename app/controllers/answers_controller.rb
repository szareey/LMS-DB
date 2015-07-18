class AnswersController < ApplicationController

def index
  @answer = Answer.all
end

def show
  @answer = Answer.find(params[:id])
  # @ansImg = Answer.find(8).final_answer_img
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
  #byebug
  # img = params[:final_answer_img]
  # decoded_data = Base64.decode64(img)
  # data = StringIO.new(decoded_data)
  # # img.original_filename = "final_answer.png"
  # # my_img = Thing.create!(final_answer_img: image)
  Answer.create(
    user_id: params[:user_id],
    question_id: params[:question_id],
    answer: params[:solution],
    final_answer_img: params[:final_answer_img],
    audio: params[:audio]
    )

  redirect_to :back
end

end
