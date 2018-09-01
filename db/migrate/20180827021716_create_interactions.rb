class CreateInteractions < ActiveRecord::Migration[5.0]
  def change
    create_table :interactions do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :like
      t.integer :share
      t.integer :comment

      t.timestamps
    end
  end
end
