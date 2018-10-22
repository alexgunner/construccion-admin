class RemoveImageCiToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_attachment :users, :imageci
  end
end
