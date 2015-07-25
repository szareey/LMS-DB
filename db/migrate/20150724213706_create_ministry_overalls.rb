class CreateMinistryOveralls < ActiveRecord::Migration
  def change
    create_table :ministry_overalls do |t|
      t.references :ministryStrands, index: true
      t.string :part
      t.string :description
      t.string :shorthand

      t.timestamps
    end
  end
end
