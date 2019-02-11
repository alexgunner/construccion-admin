class AddFieldToCarousels < ActiveRecord::Migration[5.1]
  def change
    add_column :carousels, :pic_type, :boolean
  end
end
