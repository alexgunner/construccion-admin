class CreateSoldProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :sold_products do |t|
      t.integer :product_variant_id
      t.integer :quantity

      t.timestamps
    end
  end
end
