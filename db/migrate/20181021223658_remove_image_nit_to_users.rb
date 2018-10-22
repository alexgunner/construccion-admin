class RemoveImageNitToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_attachment :users, :imagenit
  end
end
