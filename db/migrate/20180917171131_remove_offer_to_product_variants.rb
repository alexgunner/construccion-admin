class RemoveOfferToProductVariants < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_variants, :offer, :boolean
  end
end
