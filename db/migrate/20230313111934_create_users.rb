class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :encrypted_password
      t.string :email
      t.string :first_name
      t.string :last_name
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
