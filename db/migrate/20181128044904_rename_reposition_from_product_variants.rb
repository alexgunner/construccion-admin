class RenameRepositionFromProductVariants < ActiveRecord::Migration[5.1]
  def change
    rename_column :product_variants, :reposition, :available
  end
end
