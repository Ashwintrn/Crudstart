class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.belongs_to :customer , index: true
    	t.integer :orderid
    	t.string :desc
      t.timestamps
    end
  end
end
