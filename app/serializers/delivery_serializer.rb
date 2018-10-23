class DeliverySerializer < ActiveModel::Serializer
  attributes :cost, :name
  belongs_to :transport
  belongs_to :destination
  has_many :orders
end
