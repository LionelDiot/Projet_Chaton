class CreateSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :selections do |t|
      t.integer :quantity
      t.references :cart, null: false, foreign_key: true
      t.references :photo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
