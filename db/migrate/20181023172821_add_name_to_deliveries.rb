class AddNameToDeliveries < ActiveRecord::Migration[5.1]
  def change
    add_column :deliveries, :name, :string
  end
end
