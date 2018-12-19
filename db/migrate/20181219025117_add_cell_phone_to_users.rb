class AddCellPhoneToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cellphone, :integer
  end
end
