class AddAttachmentPicToAbouts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :abouts do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :abouts, :pic
  end
end
