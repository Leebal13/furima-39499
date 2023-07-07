class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :description, null: false
      t.integer :detail_category_id, null: false
      t.integer :detail_condition_id, null: false
      t.integer :delivery_format_id, null: false
      t.integer :region_id, null: false
      t.integer :arrival_id, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
    #   t.string     :title        , null: false
    #  t.text       :text         , null: false

      t.timestamps
    end
  end
end
