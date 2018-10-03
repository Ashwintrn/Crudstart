class RemovePriceFromCustomer < ActiveRecord::Migration[5.2]
  def change
  	remove_column :customers, :price
  end
end
