class CreateRegistrationRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :email, null: false
      t.string :description, null: false
      t.boolean :approved
      t.timestamps
    end
  end
end
