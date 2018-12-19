class AddImageCiToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :imageci, :string
  end
end
