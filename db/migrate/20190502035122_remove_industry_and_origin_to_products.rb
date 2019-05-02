class RemoveIndustryAndOriginToProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :industry, :string
  end
end
