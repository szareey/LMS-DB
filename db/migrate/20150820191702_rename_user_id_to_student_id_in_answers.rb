class RenameUserIdToStudentIdInAnswers < ActiveRecord::Migration
  def change
    rename_column :answers, :user_id, :student_id
  end
end
