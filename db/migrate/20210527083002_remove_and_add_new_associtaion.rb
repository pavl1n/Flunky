class RemoveAndAddNewAssocitaion < ActiveRecord::Migration[6.1]
  def change
    change_table :order_positions do |t|
      t.remove_references :restaurant_order
      t.belongs_to :order
    end
  end
end
