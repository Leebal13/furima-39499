class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :description
      t.string :detail_category
      t.string :detail_condition
      t.string :delivery_format
      t.string :region
      t.string :days
      t.integer :price

      t.references :retailer, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
