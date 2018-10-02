class AddAttachmentDetailsToProducts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :products do |t|
      t.attachment :details
    end
  end

  def self.down
    remove_attachment :products, :details
  end
end
