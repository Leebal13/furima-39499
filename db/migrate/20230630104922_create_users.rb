class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # t.string :email, null: false, unique: true
      # t.string :nickname, null: false
      # t.string :encrypted_password, null: false
      # t.string :first_name, null: false
      # t.string :last_name, null: false
      # t.string :kana_name, null: false
      # t.string :birthdate, null: false

      t.timestamps null: false
    end
  end
end
