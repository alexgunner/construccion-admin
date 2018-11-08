class AddTypesToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :typepay, :string
    add_column :orders, :typedelivery, :string
  end
end
