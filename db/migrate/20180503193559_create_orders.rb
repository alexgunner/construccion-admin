class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :client
      t.string :confirmed
      t.string :reservedate

      t.timestamps
    end
  end
end
