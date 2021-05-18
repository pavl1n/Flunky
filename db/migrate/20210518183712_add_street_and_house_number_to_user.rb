class AddStreetAndHouseNumberToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :street, :string
    add_column :users, :house_number, :string
  end
end
