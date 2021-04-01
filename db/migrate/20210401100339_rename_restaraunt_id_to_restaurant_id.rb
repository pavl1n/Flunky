class RenameRestarauntIdToRestaurantId < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :restaraunt_id, :restaurant_id
  end
end
