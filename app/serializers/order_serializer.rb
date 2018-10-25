class OrderSerializer < ActiveModel::Serializer
  attributes :orderdate, :state
  has_many :carts
  has_one :client
  belongs_to :delivery
end
