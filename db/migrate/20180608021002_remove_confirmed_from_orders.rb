class RemoveConfirmedFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :confirmed, :string
  end
end
