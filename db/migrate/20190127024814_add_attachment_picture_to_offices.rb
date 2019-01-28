class AddAttachmentPictureToOffices < ActiveRecord::Migration[5.1]
  def self.up
    change_table :offices do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :offices, :picture
  end
end
