class ChangePhoneUserTypeToNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :phone_number, true
    add_index :users, :phone_number, unique: true
  end
end
