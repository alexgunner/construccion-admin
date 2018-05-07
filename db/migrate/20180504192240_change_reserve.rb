class ChangeReserve < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :reserve, :orderdate
  end
end
