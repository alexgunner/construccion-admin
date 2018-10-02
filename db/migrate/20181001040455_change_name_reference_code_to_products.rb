class ChangeNameReferenceCodeToProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :reference_code, :code
  end
end
