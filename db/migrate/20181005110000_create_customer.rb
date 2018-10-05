class CreateCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
    	t.string :name
      t.date :dob
      t.string :address
      t.integer :phone

      t.timestamps
    end
  end
end
