class RenameLastNameToOrders < ActiveRecord::Migration[5.1]
  def change
    rename_column :clients, :lastName, :lastname
  end
end
