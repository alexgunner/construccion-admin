class AddTypeDelivery < ActiveRecord::Migration[5.1]
  def change
    add_column :deliveries, :typedelivery, :string
  end
end
