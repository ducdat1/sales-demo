class AddQuantityToLineItems < ActiveRecord::Migration[5.0]
  def up
    add_column :line_items, :quantity, :integer, :default => 1
  end
  def down
    remove_column :line_items, :quantity
  end
end
