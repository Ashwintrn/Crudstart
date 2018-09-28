class RemoveItemFromCustomer < ActiveRecord::Migration[5.2]
  def change
		remove_column :customers, :items
  end
end
