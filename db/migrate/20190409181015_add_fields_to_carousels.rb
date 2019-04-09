class AddFieldsToCarousels < ActiveRecord::Migration[5.1]
  def change
    add_column :carousels, :web_link, :string
  end
end
