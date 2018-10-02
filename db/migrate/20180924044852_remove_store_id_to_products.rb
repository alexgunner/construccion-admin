class RemoveStoreIdToProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :store_id, :integer
  end
end
