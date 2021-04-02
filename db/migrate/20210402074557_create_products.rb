class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :restaurant_id, null: false
      t.string :name, null: false
      t.money :price, null: false
      t.string :category, null: false
      t.string :description

      t.timestamps
    end
  end
end
