class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :ino
      t.string :name
      t.float :price
      t.integer :stock

      t.timestamps
    end
  end
end
