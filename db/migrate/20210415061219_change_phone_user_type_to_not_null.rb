class ChangePhoneUserTypeToNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :phone_number, true
    change_column_null :users, :user_type, true
    add_index :users, :phone_number, unique: true
  end
end
