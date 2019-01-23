class AddTotalSoldToSoldProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :sold_products, :total_sold, :integer
  end
end
