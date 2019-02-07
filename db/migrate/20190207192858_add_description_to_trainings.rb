class AddDescriptionToTrainings < ActiveRecord::Migration[5.1]
  def change
    add_column :trainings, :description, :string
  end
end
