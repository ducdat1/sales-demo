class AddCategoryToProduct < ActiveRecord::Migration[5.0]
  def up
    add_column :products, :cat_id, :integer
  end
  def down
    remove_column :products, :cat_id
  end
end
