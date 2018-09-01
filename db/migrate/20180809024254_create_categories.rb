class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories, :id=>false do |t|
      t.column :cat_id, 'int(11) primary key'
      t.string :cat_name
      t.text :cat_content

      t.timestamps
    end
  end
end
