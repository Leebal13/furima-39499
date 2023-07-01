class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :buyer, null: false
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
