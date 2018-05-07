class OrderSerializer < ActiveModel::Serializer
<<<<<<< HEAD
  attributes :orderdate, :client, :confirmed
  has_many :carts
=======
  attributes :id, :client, :confirmed, :reservedate
>>>>>>> 3d075932b78a3d541d64c6b150d72419e6315be4
end
