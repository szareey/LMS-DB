# It transform params of the query to the Question's model.
# For each image of the query it create a new Question model.
class Question::BatchForm
  def initialize(params)
    @questions = transform(params)
  end

  def save
    is_saved = false
    Question.transaction do
      is_saved = @questions.all? {|q| q.save }
      raise ActiveRecord::Rollback unless is_saved
    end
    is_saved
  end

  def to_models
    @questions
  end

  private
  
  def transform(params)
    if params[:questions].blank?
      [Question.new(
        params.except(:questions)
      )]
    else
      params[:questions].collect do |question|
        Question.new(
          params
            .except(:questions)
            .merge({question: question})
        )
      end
    end
  end
end