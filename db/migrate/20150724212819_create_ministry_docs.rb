class CreateMinistryDocs < ActiveRecord::Migration
  def change
    create_table :ministry_docs do |t|
      t.string :subject
      t.boolean :grade9
      t.boolean :grade10
      t.boolean :grade11
      t.boolean :grade12
      t.string :province
      t.string :year
      t.string :title
      t.string :URLpdf

      t.timestamps
    end
  end
end
