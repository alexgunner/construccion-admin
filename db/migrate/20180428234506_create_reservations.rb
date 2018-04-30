class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :reserve_date
      t.string :client
      t.string :confirmed

      t.timestamps
    end
  end
end
