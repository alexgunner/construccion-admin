class AddWholeSalePriceToProductVariant < ActiveRecord::Migration[5.1]
  def change
    add_column :product_variants, :whole_sale_price, :float
  end
end
