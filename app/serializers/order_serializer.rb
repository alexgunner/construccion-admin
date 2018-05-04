class OrderSerializer < ActiveModel::Serializer
  attributes :id, :client, :confirmed, :reservedate
end
