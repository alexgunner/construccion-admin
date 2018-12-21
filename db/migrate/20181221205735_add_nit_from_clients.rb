class AddNitFromClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :nit, :string
  end
end
