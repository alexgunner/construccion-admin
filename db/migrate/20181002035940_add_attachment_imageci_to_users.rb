class AddAttachmentImageciToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :imageci
    end
  end

  def self.down
    remove_attachment :users, :imageci
  end
end
