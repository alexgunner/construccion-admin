class AddDeliveryIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :deliveryid, :integer
  end
end
