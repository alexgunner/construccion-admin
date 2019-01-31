class Destination < ApplicationRecord
  default_value_for :cash, false
  has_many :deliveries

  def name_with_city
    "#{name} - #{city}"
  end
end
