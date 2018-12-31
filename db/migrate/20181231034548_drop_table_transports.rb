class DropTableTransports < ActiveRecord::Migration[5.1]
  def up
    drop_table :transports
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
