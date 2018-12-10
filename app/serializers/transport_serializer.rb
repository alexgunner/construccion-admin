class TransportSerializer < ActiveModel::Serializer
  attributes :name, :typetransport
  has_many :deliveries
end
