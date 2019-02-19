class RemoveDeliveryIdToOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :delivery_id, :integer
  end
end
