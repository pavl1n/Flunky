class CreateOrderPositions < ActiveRecord::Migration[6.1]
  def change
    create_table :order_positions do |t|
      t.belongs_to :product
      t.belongs_to :restaurant_order
      t.timestamps
    end
  end
end
