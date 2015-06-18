class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :user
      t.attachment :question
      t.timestamps
    end
  end
end
