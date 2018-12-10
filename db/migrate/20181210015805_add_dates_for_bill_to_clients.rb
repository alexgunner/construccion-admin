class AddDatesForBillToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :nit, :integer
    add_column :clients, :nameinvoice, :string
  end
end
