class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: 'user'
      t.string :city, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :login_status, null: false, default: 'unregistered'
      t.string :phone_number, null: false
      t.integer :user_type, null: false

      t.timestamps
    end
  end
end
