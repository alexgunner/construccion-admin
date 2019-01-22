class RemoveUserIdToClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :userid, :integer
  end
end
