class AddStatusToProduct < ActiveRecord::Migration[5.0]
  def up
    add_column :products, :status, :integer
  end
  def down
    remove_column :products, :status
  end
end
