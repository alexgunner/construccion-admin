class AddAttachmentDocuToTrainings < ActiveRecord::Migration[5.1]
  def self.up
    change_table :trainings do |t|
      t.attachment :docu
    end
  end

  def self.down
    remove_attachment :trainings, :docu
  end
end
