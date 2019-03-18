class AddFieldsToProviders < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :website_link, :string
  end
end
