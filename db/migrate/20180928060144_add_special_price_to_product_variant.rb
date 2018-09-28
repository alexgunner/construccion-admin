class AddSpecialPriceToProductVariant < ActiveRecord::Migration[5.1]
  def change
    add_column :product_variants, :specialist_price, :float
  end
end
