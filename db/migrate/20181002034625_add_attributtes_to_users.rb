class AddAttributtesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :ci, :integer
    add_column :users, :phone, :integer
    add_column :users, :address, :text
  end
end
