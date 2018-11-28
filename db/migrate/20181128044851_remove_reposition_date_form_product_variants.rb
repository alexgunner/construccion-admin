class RemoveRepositionDateFormProductVariants < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_variants, :repositiondate, :date
  end
end
