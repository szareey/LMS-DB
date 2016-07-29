class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :province_state
      t.string :city
      t.string :postal_zip_code
      t.references :user
    end
  end
end
