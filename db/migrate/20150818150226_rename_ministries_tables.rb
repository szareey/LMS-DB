class RenameMinistriesTables < ActiveRecord::Migration
  def change
    rename_table 'ministry_courses', 'ministry_doc_courses'
    rename_table 'ministry_overalls', 'ministry_doc_overalls'
    rename_table 'ministry_specifics', 'ministry_doc_specifics'
    rename_table 'ministry_strands', 'ministry_doc_strands'

    rename_column :ministry_doc_overalls, :ministry_strand_id, :strand_id
    rename_column :ministry_doc_specifics, :ministry_overall_id, :overall_id
    rename_column :ministry_doc_strands, :ministry_course_id, :course_id
  end
end
