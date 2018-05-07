class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.string :product
      t.integer :quantity
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
