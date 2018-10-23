class AddRoleToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :role, :string
  end
end
