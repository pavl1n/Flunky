class RemoveAssociationFromClientToOrder < ActiveRecord::Migration[6.1]
  def change
    change_table :orders do |t|
      t.remove_references :user
    end
  end
end
