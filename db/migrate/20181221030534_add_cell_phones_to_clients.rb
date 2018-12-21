class AddCellPhonesToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :cellphone, :integer
    add_column :clients, :cellwsp, :integer
  end
end
