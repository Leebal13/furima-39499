class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string :postal_code, null: false
      t.string :region, null: false
      t.string :prefecture, null: false
      t.string :address_no, null: false
      t.string :building_no
      t.string :phone_number, null: false

      t.timestamps null: false
    end
  end
end
