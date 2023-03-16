class CreateSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :selections do |t|
      t.belongs_to :photo, index: true
      t.belongs_to :cart, index: true
      t.timestamps
    end
  end
end
