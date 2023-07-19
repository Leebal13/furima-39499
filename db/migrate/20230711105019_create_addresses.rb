class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.integer :region_id, null: false
      t.string :city, null: false
      t.string :address_no, null: false
      t.string :building_no
      t.string :phone_number, null: false
      t.references :purchase, foreign_key: true

      t.timestamps null: false
    end
  end
end
