class AddAttachmentCoverToProviders < ActiveRecord::Migration[5.1]
  def self.up
    change_table :providers do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :providers, :cover
  end
end
