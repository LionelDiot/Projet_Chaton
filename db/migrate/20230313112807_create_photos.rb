class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.decimal :price
      t.string :title
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
