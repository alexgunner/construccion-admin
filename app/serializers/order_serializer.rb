class OrderSerializer < ActiveModel::Serializer
  attributes :orderdate, :state, :typepay, :typedelivery, :total, :userid, :office, :cost, :deliveryid
  has_many :carts
  belongs_to :client
  belongs_to :destination
end
