class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :ministrySpecifics_id
      t.string :user_id
      t.string :lesson
      t.string :difficulty
      t.string :audio
      t.string :homework

      t.timestamps
    end
  end
end
