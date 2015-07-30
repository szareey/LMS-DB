class LessonsMinistrySpecifics < ActiveRecord::Migration
  def change
    create_table :lessons_ministry_specifics do |t|
      t.references :lesson, :ministry_specific, index: true
      t.timestamps
    end
  end
end
