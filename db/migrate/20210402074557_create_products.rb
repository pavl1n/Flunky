class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.belongs_to :user
      t.string :name, null: false
      t.money :price, null: false
      t.string :category, null: false
      t.text :description

      t.timestamps
    end
  end
end
