class AddAttachmentPicToServices < ActiveRecord::Migration[5.1]
  def self.up
    change_table :services do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :services, :pic
  end
end
