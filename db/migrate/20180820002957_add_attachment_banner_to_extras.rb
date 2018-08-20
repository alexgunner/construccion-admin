class AddAttachmentBannerToExtras < ActiveRecord::Migration[5.1]
  def self.up
    change_table :extras do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :extras, :banner
  end
end
