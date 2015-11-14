class CreateTablesForCourseOutlines < ActiveRecord::Migration
  def change
    create_table :course_outlines do |t|
      t.references :ministry_doc_course
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

    create_table :standard_infos do |t|
      t.string :vision_statement_title
      t.string :vision_statement_description
      t.string :learning_skills_title
      t.string :learning_skills_description
      t.timestamps
    end

    create_table :course_contents do |t|
      t.references :course_outline
      t.integer :unit
      t.string :unit_title
      t.integer :hours
      t.timestamps
    end

    create_table :evaluations do |t|
      t.references :course_content
      t.string :type
      t.string :description
      t.integer :weight
      t.timestamps
    end

    create_table :teaching_stradegies do |t|
      t.references :ministry_doc
      t.string :title
      t.string :description
      t.timestamps
    end

    create_table :assessments do |t|
      t.references :ministry_doc
      t.string :type
      t.string :description
    end

    create_table :considerations do |t|
      t.references :ministry_doc
      t.string :title
      t.string :description
    end

    create_table :resources do |t|
      t.references :ministry_doc_course
      t.string :description
    end

  end
end
