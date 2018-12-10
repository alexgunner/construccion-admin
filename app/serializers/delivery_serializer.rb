class DeliverySerializer < ActiveModel::Serializer
  attributes :cost, :name, :typedelivery
  belongs_to :transport
  belongs_to :destination
  has_many :orders
end
