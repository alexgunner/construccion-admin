class Delivery < ApplicationRecord
  belongs_to :destination
  belongs_to :transport
end
