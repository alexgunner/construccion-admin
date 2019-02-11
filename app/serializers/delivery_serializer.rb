class DeliverySerializer < ActiveModel::Serializer
  attributes :cost, :name, :typedelivery, :phone, :address, :shipping, :costmin
  belongs_to :destination
  has_many :orders
end
