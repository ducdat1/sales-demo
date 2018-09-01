class RenameCatIdProduct < ActiveRecord::Migration[5.0]
  def up
    rename_column :products, :cat_id, :category_id
  end
end
