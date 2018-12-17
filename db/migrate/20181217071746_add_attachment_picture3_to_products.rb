class AddAttachmentPicture3ToProducts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :products do |t|
      t.attachment :picture3
    end
  end

  def self.down
    remove_attachment :products, :picture3
  end
end
