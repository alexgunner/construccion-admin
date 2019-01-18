class AddAttachmentPictureToOrders < ActiveRecord::Migration[5.1]
  def self.up
    change_table :orders do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :orders, :picture
  end
end
