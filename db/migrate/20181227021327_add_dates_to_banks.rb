class AddDatesToBanks < ActiveRecord::Migration[5.1]
  def change
    add_column :banks, :nameaccount, :string
    add_column :banks, :typemoney, :string
  end
end
