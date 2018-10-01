class ChangeOfferPriceToProductVariant < ActiveRecord::Migration[5.1]
  def change
    rename_column :product_variants, :offer_price, :offerprice
  end
end
