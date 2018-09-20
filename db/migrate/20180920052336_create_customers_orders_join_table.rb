class CreateCustomersOrdersJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :customers_orders, id: false do |t|
  		t.integer :customer_id
  		t.integer :order_id
  	end

  	add_index :customers_orders, :customer_id
  	add_index :customers_orders, :order_id
  end
end
