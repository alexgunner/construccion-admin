class RemoveProductFromCarts < ActiveRecord::Migration[5.1]
  def change
    remove_column :carts, :product, :string
  end
end
