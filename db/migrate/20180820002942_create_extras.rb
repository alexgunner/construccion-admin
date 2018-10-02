class CreateExtras < ActiveRecord::Migration[5.1]
  def change
    create_table :extras do |t|
      t.string :name
      t.text :services

      t.timestamps
    end
  end
end
