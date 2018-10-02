class AddAttachmentPictureToContacts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :contacts do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :contacts, :picture
  end
end
