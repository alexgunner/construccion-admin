class AddUserIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :userid, :integer
  end
end
