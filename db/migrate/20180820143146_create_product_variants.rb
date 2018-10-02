class CreateProductVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variants do |t|
      t.string :variant_size
      t.float :price
      t.integer :product_id
      t.string :description
      t.string :reference_code
      t.boolean :reposition
      t.boolean :offer
      t.float :offer_price

      t.timestamps
    end
  end
end
