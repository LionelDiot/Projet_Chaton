class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.decimal :total, default: 0.00
      t.string :urls, array: true, default: []
      t.string :titles, array: true, default: []
      t.timestamps
    end
  end
end
