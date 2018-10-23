class DestinationSerializer < ActiveModel::Serializer
  attributes :name, :city, :country
  has_many :deliveries
end
