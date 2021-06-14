class UpdateCommentForeignKey < ActiveRecord::Migration[6.1]
  def change
    change_table :comments do |t|
      t.remove_references :product
      t.references :product, null: false, foreign_key: true, on_delete: :cascade
    end
  end
end
