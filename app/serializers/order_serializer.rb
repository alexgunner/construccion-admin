class OrderSerializer < ActiveModel::Serializer
  attributes :orderdate, :state, :typepay, :typedelivery
  has_many :carts
  belongs_to :client
  belongs_to :delivery
end
