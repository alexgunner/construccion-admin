class CreateIndustries < ActiveRecord::Migration[5.1]
  def change
    create_table :industries do |t|
      t.string :country
      t.string :origin

      t.timestamps
    end
  end
end
