class RenameCodeToProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :code, :reference_code
  end
end
