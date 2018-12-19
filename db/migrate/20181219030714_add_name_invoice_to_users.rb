class AddNameInvoiceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nameinvoice, :integer
  end
end
