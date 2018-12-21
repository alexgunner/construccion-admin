class RemoveLastNameToClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :lastname, :string
  end
end
