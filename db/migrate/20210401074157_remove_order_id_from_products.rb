class RemoveOrderIdFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :order_id, :bigint
    remove_column :products, :restaurant_id, :bigint
  end
end
