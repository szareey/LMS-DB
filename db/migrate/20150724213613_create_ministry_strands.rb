class CreateMinistryStrands < ActiveRecord::Migration
  def change
    create_table :ministry_strands do |t|
      t.references :ministry_course, index: true
      t.string :part
      t.string :title

      t.timestamps
    end
  end
end
