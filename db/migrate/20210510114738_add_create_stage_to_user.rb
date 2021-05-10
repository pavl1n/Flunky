class AddCreateStageToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :create_stage, :integer
  end
end
