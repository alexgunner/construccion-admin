class AddUserIdAndStateToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :user_id, :integer
    add_column :carts, :state, :boolean
  end
end
