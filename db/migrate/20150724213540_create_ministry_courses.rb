class CreateMinistryCourses < ActiveRecord::Migration
  def change
    create_table :ministry_courses do |t|
      t.references :ministry_doc, index: true
      t.string :grade
      t.string :title
      t.string :description
      t.string :code
      t.string :pre_req
      t.string :level
      t.string :credit_value

      t.timestamps
    end
  end
end
