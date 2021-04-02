class CreateRestaurantOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_orders do |t|
      t.belongs_to :order
      t.belongs_to :users
      t.boolean :approved
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
