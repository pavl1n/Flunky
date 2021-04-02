class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :products
      t.belongs_to :user
      t.boolean :approved
      t.integer :status, default: 0
      t.integer :payment_type, null: false, default: 0

      t.timestamps
    end
  end
end
