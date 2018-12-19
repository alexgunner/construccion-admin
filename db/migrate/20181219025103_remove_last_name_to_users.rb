class RemoveLastNameToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :lastname, :string
  end
end
