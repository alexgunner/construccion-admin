class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :lastName, :address, :phone, :mail, :nit
  has_many :orders
end
