class RenameVariantIdToStocks < ActiveRecord::Migration[5.1]
  def change
    rename_column :stocks, :variant_id, :product_variant_id
  end
end
