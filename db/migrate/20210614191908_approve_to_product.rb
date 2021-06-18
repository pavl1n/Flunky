class ApproveToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :approved, :boolean
  end
end
