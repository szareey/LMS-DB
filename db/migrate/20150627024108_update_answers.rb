class UpdateAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :teacher_comment, :string
    add_column :answers, :grade, :integer
    add_column :answers, :request_meeting, :boolean, default: false
  end
end
