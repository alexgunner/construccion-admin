class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :lastName
      t.text :address
      t.integer :phone
      t.string :mail
      t.integer :nit

      t.timestamps
    end
  end
end
