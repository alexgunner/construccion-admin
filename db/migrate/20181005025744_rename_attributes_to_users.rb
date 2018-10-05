class RenameAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :firstName, :name
    rename_column :users, :lastName, :lastname
  end
end
