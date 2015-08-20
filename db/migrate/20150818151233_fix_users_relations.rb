class FixUsersRelations < ActiveRecord::Migration
  def change
    rename_column :lessons, :user_id, :teacher_id
    rename_column :questions, :user_id, :teacher_id
  end
end
