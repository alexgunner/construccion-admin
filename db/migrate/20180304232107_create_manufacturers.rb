class CreateManufacturers < ActiveRecord::Migration[5.1]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :description
      t.string :country
      t.string :city
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
