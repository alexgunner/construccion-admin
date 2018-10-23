class TransportSerializer < ActiveModel::Serializer
  attributes :name
  has_many :deliveries
end
