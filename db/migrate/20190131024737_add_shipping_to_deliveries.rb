class AddShippingToDeliveries < ActiveRecord::Migration[5.1]
  def change
    add_column :deliveries, :shipping, :string
  end
end
