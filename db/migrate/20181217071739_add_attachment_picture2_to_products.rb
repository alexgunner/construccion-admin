class AddAttachmentPicture2ToProducts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :products do |t|
      t.attachment :picture2
    end
  end

  def self.down
    remove_attachment :products, :picture2
  end
end
