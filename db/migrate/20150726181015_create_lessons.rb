class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :ministry_specific
      t.references :user
      t.string :lesson
      t.string :title
      t.string :difficulty
      t.attachment :audio
      t.string :homework
      t.timestamps
    end
  end
end
