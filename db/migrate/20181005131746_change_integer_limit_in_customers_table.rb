class ChangeIntegerLimitInCustomersTable < ActiveRecord::Migration[5.2]
  def change
  	change_column :customers, :phone, :integer, limit: 8
  end
end
