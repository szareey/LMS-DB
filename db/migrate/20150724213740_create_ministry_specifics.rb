class CreateMinistrySpecifics < ActiveRecord::Migration
  def change
    create_table :ministry_specifics do |t|
      t.references :ministry_overalls, index: true
      t.string :part
      t.string :description

      t.timestamps
    end
  end
end
