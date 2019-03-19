class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :country
      t.string :city
      t.string :message

      t.timestamps
    end
  end
end
