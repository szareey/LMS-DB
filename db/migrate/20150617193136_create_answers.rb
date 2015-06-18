class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.string :answer
      t.timestamps
    end
  end
end
