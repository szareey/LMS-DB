class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :ministrySpecifics
      t.references :users
      t.string :lesson
      t.string :difficulty
      t.attachment :audio
      t.string :homework
      t.timestamps
    end
  end
end
