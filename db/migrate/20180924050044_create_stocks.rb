class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.integer :store_id
      t.integer :product_id
      t.integer :variant_id
      t.integer :quantity
      t.integer :limit

      t.timestamps
    end
  end
end
