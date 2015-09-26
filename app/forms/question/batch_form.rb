# It transform params of the query to the Question's model.
# For each image of the query it create a new Question model.
class Question::BatchForm
  def initialize(params)
    @image_ids = params[:image_ids].try(:split, ',')
    @questions = transform(params) 
  end

  def save
    p @image_ids.blank?
    return false if @image_ids.blank?

    is_saved = false
    Question.transaction do
      is_saved = @questions.all? {|q| q.save }
      raise ActiveRecord::Rollback unless is_saved
    end
    Question::TempImage.delete @image_ids
    is_saved
  end

  def to_models
    @questions
  end

  private
  
  def transform(params)
    if @image_ids.blank?
      [Question.new(
        params.except(:image_ids)
      )]
    else
      @image_ids.collect do |image_id|
        Question.new(
          params
            .except(:image_ids)
            .merge(question: Question::TempImage.find(image_id).image)
        )
      end
    end
  end
end