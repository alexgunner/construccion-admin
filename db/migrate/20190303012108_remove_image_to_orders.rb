class RemoveImageToOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :image, :string
  end
end
