class AddAttachmentDepositToOrders < ActiveRecord::Migration[5.1]
  def self.up
    change_table :orders do |t|
      t.attachment :deposit
    end
  end

  def self.down
    remove_attachment :orders, :deposit
  end
end
