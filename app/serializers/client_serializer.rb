class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :lastname, :address, :phone, :mail, :nit, :count
  has_many :orders
end
