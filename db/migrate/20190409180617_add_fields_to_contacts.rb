class AddFieldsToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :twitter, :string
    add_column :contacts, :youtube, :string
  end
end
