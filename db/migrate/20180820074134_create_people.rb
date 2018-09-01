class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
