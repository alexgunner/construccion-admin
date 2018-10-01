class RenameProductIdToCarts < ActiveRecord::Migration[5.1]
  def change
    rename_column :carts, :product_id, :product_variant_id
  end
end
