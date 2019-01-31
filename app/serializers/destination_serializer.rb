class DestinationSerializer < ActiveModel::Serializer
  attributes :name, :city, :country, :cash
  has_many :deliveries
end
