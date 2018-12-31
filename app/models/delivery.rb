class Delivery < ApplicationRecord
  belongs_to :destination
  has_many :orders
end
