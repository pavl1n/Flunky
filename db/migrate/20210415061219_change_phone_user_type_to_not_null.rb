class ChangePhoneUserTypeToNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :phone_number, true
    add_column :users, :create_stage, :integer
    add_index :users, :phone_number, unique: true
  end
end
