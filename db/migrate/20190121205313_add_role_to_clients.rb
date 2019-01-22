class AddRoleToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :role, :string
  end
end
