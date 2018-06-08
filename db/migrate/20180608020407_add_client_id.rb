class AddClientId < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :client_id, :integer
  end
end
