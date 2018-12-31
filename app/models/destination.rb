class Destination < ApplicationRecord
  has_many :deliveries

  def name_with_city
    "#{name} - #{city}"
  end
end
