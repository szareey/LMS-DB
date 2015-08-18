class RenameHabtmTables < ActiveRecord::Migration
  def change
    rename_table 'ministry_specifics_questions', 'ministry_doc_specifics_questions'
    rename_table 'lessons_ministry_specifics', 'lessons_ministry_doc_specifics'
    
    rename_column :ministry_doc_specifics_questions, :ministry_specific_id, :specific_id
    rename_column :lessons_ministry_doc_specifics, :ministry_specific_id, :specific_id
  end
end
