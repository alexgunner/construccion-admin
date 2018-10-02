class AddAttachmentImagenitToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :imagenit
    end
  end

  def self.down
    remove_attachment :users, :imagenit
  end
end
