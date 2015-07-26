class LessonsMinistrySpecifics < ActiveRecord::Migration
  def change
    create_table :lessons_ministry_specifics do |t|
      t.references :lessons, :ministry_specifics, index: true
      t.timestamps
    end
  end
end
