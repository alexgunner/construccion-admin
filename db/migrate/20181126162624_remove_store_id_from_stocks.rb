class RemoveStoreIdFromStocks < ActiveRecord::Migration[5.1]
  def change
    remove_column :stocks, :store_id, :integer
  end
end
