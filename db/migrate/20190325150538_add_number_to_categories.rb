class AddNumberToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :number, :integer
  end
end
