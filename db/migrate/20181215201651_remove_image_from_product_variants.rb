class RemoveImageFromProductVariants < ActiveRecord::Migration[5.1]
  def change
    remove_attachment :product_variants, :picture
  end
end
