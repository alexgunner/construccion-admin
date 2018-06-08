class RemoveClientFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :client, :string
  end
end
