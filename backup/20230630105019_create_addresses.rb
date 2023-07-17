class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string :postal_code, null: false
      t.integer :region, null: false
      t.string :prefecture
      t.string :address_no
      t.string :building_no
      t.string :phone_number, null: false
      t.references :purchase,      null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
