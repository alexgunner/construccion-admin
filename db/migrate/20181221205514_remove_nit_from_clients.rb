class RemoveNitFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :nit, :integer
  end
end
