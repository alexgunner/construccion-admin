class Delivery < ApplicationRecord
  belongs_to :destination
  belongs_to :transport
  has_many :orders
end
