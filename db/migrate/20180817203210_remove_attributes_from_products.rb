class RemoveAttributesFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :price, :float
    remove_column :products, :color, :string
  end
end
