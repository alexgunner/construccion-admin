class AddFieldToTrainings < ActiveRecord::Migration[5.1]
  def change
    add_reference :trainings, :training_category, foreign_key: true
  end
end
