class AddNameInvoiceStringToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nameinvoice, :string
  end
end
