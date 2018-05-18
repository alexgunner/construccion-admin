class OrderSerializer < ActiveModel::Serializer
  attributes :orderdate, :client, :confirmed
  #has_many :carts
end
