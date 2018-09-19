class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.date :dob
      t.string :address
      t.integer :phone
      t.integer :items
      t.float :price

      t.timestamps
    end
  end
end
