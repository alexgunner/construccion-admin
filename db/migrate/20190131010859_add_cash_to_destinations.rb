class AddCashToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :cash, :boolean
  end
end
