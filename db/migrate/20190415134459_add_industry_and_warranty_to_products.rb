class AddIndustryAndWarrantyToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :industry, :string
    add_column :products, :warranty, :string
  end
end
