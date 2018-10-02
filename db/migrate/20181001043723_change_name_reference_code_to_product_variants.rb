class ChangeNameReferenceCodeToProductVariants < ActiveRecord::Migration[5.1]
  def change
    rename_column :product_variants, :reference_code, :code
  end
end
