class OrderSerializer < ActiveModel::Serializer
  attributes :orderdate
  has_many :carts
  has_one :client
  belongs_to :delivery
end
