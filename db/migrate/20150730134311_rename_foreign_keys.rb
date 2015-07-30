class RenameForeignKeys < ActiveRecord::Migration
  def change
    rename_column :ministry_courses, :ministry_docs_id, :ministry_doc_id
    rename_column :ministry_overalls, :ministry_strands_id, :ministry_strand_id
    rename_column :ministry_specifics, :ministry_overalls_id, :ministry_overall_id
    rename_column :ministry_strands, :ministry_courses_id, :ministry_course_id
  end
end
