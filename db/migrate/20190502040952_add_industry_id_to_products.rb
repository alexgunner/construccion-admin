class AddIndustryIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :industry_id, :integer
  end
end
