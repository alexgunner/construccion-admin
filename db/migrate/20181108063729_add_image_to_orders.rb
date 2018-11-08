class AddImageToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :image, :string
  end
end
