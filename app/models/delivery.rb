class Delivery < ApplicationRecord
  belongs_to :destination
  def name_with_cost
    "#{name} - Costo: Bs. #{cost}"
  end
end
