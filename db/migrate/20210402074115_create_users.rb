class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :city
      t.string :phone_number
      t.integer :user_type

      t.timestamps
    end
  end
end
