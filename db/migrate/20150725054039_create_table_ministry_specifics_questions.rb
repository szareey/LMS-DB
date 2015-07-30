class CreateTableMinistrySpecificsQuestions < ActiveRecord::Migration
  def change
    create_table :ministry_specifics_questions do |t|
      t.references :ministry_specific, :question, index: true
      t.timestamps
    end
  end
end
