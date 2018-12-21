class RemoveNameInvoiceToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :nameinvoice, :integer
  end
end
