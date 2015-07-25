class CreateMinistryCourses < ActiveRecord::Migration
  def change
    create_table :ministry_courses do |t|
      t.references :ministryDocs, index: true
      t.string :grade
      t.string :title
      t.string :description
      t.string :code
      t.string :preReq
      t.string :level
      t.string :creditValue

      t.timestamps
    end
  end
end
