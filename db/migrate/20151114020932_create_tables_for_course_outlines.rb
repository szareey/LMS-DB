class CreateTablesForCourseOutlines < ActiveRecord::Migration
  def change
    create_table :course_outlines do |t|
      t.references :course, index: true
      t.date :year 
      t.integer :semester
      t.date :development_date
      t.date :revision_date
      t.string :developer
      t.string :teacher
      t.string :reviser
      t.string :school
      t.timestamps
    end

    create_table :course_outlines_course_contents do |t|
      t.references :course_outline, index: true
      t.integer :unit
      t.string :unit_title
      t.integer :hours
      t.timestamps
    end

    create_table :course_outlines_evaluations do |t|
      t.references :course_content, index: true
      t.string :type
      t.string :description
      t.integer :weight
      t.timestamps
    end

    create_table :ministry_doc_teaching_stradegies do |t|
      t.references :ministry_doc, index: true
      t.string :title
      t.string :description
      t.timestamps
    end

    create_table :ministry_doc_assessments do |t|
      t.references :ministry_doc, index: true
      t.string :type
      t.string :description
    end

    create_table :ministry_doc_considerations do |t|
      t.references :ministry_doc, index: true
      t.string :title
      t.string :description
    end

    create_table :ministry_doc_resources do |t|
      t.references :course, index: true
      t.string :description
    end

  end
end
