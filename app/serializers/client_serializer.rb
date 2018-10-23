class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :lastName, :address, :phone, :mail, :nit, :count
  has_many :orders
end
