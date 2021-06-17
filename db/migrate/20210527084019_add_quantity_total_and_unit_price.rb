class AddQuantityTotalAndUnitPrice < ActiveRecord::Migration[6.1]
  def change
    add_column :order_positions, :quantity, :integer
    add_column :order_positions, :total, :money
    add_column :order_positions, :unit_price, :money
    add_column :orders, :subtotal, :money
    add_column :orders, :total, :money
  end
end
