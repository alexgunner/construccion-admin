class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :state

      t.timestamps
    end
  end
end
