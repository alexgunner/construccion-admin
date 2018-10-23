class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.integer :destination_id
      t.integer :transporter_id
      t.float :cost

      t.timestamps
    end
  end
end
