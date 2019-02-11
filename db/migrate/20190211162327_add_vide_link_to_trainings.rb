class AddVideLinkToTrainings < ActiveRecord::Migration[5.1]
  def change
    add_column :trainings, :videolink, :string
  end
end
