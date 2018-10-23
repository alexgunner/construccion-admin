class DeliverySerializer < ActiveModel::Serializer
  attributes :cost
  belongs_to :transport
  belongs_to :destination
end
