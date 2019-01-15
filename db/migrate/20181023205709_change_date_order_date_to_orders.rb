class ChangeDateOrderDateToOrders < ActiveRecord::Migration[5.1]
  def up
    change_table :orders do |t|
      t.change :orderdate, 'timestamp USING CAST(orderdate AS timestamp)'
    end

  end

  def down
    change_table :orders do |t|
      t.change :orderdate, :string
    end
  end
end
