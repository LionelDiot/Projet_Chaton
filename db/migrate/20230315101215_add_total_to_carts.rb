class AddTotalToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :total, :float, default: 0.00
  end
end
