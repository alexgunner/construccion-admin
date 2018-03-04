class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :description
      t.string :email
      t.string :phone
      t.string :address
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
