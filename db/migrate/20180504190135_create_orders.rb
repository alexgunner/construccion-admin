class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :reserve
      t.string :client
      t.string :confirmed

      t.timestamps
    end
  end
end
