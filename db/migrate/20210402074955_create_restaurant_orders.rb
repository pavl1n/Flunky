class CreateRestaurantOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_orders do |t|
      t.integer :order_id, null: false
      t.integer :restaurant_id, null: false
      t.integer :state, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
