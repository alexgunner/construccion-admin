class CreateTrainingCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :training_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
