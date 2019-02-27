class RemoveCiAndNitasStringToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :imageci, :string
    remove_column :users, :image, :string
  end
end
