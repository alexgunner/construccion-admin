class RenameStatusToStores < ActiveRecord::Migration[5.1]
  def change
    rename_column :stores, :state, :role
  end
end
