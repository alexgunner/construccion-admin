class OrderSerializer < ActiveModel::Serializer
  attributes :orderdate, :state
  has_many :carts
  belongs_to :client
  belongs_to :delivery
end
