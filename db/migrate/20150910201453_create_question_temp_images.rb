class CreateQuestionTempImages < ActiveRecord::Migration
  def change
    create_table :question_temp_images do |t|

      t.timestamps
    end
  end
end
