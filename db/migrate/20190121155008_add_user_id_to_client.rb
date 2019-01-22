class AddUserIdToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :userid, :integer
  end
end
