class AddAttachmentLogoToExtras < ActiveRecord::Migration[5.1]
  def self.up
    change_table :extras do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :extras, :logo
  end
end
