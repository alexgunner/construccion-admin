class AddAddressToManufacturers < ActiveRecord::Migration[5.1]
  def change
    add_column :manufacturers, :address, :string
  end
end
