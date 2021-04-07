class CreateRestaurantOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_orders do |t|
      t.belongs_to :user
      t.belongs_to :products
      t.belongs_to :order
      t.boolean :approved
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
