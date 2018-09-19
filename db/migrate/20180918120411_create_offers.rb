class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
    	t.belongs_to :customer, index: true
      t.integer :oid
      t.timestamps
    end

  end
end
