class AddUserIdToPerson < ActiveRecord::Migration[5.0]
  def up
    add_column :people, :user_id, :integer
  end
  def down
    remove_column :people, :user_id
  end
end
