class RenameAtrributeWithSpacesToProductVariants < ActiveRecord::Migration[5.1]
  def change
    rename_column :product_variants, :variant_size, :size
    rename_column :product_variants, :specialist_price, :specialistprice
    rename_column :product_variants, :whole_sale_price, :wholesaleprice
  end
end
