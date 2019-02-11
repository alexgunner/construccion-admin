class AddAttachmentPicToCarousels < ActiveRecord::Migration[5.1]
  def self.up
    change_table :carousels do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :carousels, :pic
  end
end
