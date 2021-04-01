class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :product_id, null: false
      t.integer :user_id, null: false
      t.integer :state, default: 0
      t.integer :status, default: 0
      t.integer :payment_type

      t.timestamps
    end
  end
end
