class AddAttachmentPictureToProductVariants < ActiveRecord::Migration[5.1]
  def self.up
    change_table :product_variants do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :product_variants, :picture
  end
end
