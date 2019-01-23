class AddTotalToSoldProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :sold_products, :total, :float
  end
end
