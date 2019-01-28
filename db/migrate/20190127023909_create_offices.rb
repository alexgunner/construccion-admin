class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :city
      t.integer :phone
      t.integer :cellphone
      t.integer :cellwsp
      t.string :address
      t.string :lat
      t.string :long
      t.string :email

      t.timestamps
    end
  end
end
