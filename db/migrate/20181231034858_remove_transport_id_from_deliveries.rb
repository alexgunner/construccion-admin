class RemoveTransportIdFromDeliveries < ActiveRecord::Migration[5.1]
  def change
    remove_column :deliveries, :transport_id, :integer
  end
end
