class RemoveDestinationIdToOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :destination_id, :integer
  end
end
