class CreateProductRestOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :product_rest_orders do |t|
      t.belongs_to :products
      t.belongs_to :restaurant_orders

      t.timestamps
    end
  end
end
