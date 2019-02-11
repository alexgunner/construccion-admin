class AddCostMinToDeliveries < ActiveRecord::Migration[5.1]
  def change
    add_column :deliveries, :costmin, :float
  end
end
