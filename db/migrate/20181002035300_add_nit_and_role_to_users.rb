class AddNitAndRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nit, :string
    add_column :users, :role, :string
  end
end
