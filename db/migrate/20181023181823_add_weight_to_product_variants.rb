class AddWeightToProductVariants < ActiveRecord::Migration[5.1]
  def change
    add_column :product_variants, :weight, :float
  end
end
