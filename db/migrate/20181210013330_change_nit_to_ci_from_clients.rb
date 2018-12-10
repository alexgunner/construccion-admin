class ChangeNitToCiFromClients < ActiveRecord::Migration[5.1]
  def change
    rename_column :clients, :nit, :ci
  end
end
