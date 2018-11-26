class DropStoresTable < ActiveRecord::Migration[5.1]
  def up
   drop_table :stores
 end

 def down
   raise ActiveRecord::IrreversibleMigration
 end
end
