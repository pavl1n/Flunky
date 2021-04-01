class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :restaurant_id, null: false
      t.string :name
      t.money :price
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
