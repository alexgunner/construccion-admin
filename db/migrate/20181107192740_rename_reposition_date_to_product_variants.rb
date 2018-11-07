class RenameRepositionDateToProductVariants < ActiveRecord::Migration[5.1]
  def change
    rename_column :product_variants, :reposition_date, :repositiondate
  end
end
