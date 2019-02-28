class AddDestinationIdToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :destination_id, :integer
  end
end
