class AddAttributesToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :lat, :string
    add_column :contacts, :long, :string
    add_column :contacts, :about, :text
    add_column :contacts, :mission, :text
    add_column :contacts, :vision, :text
  end
end
