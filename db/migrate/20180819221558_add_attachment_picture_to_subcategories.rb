class AddAttachmentPictureToSubcategories < ActiveRecord::Migration[5.1]
  def self.up
    change_table :subcategories do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :subcategories, :picture
  end
end
