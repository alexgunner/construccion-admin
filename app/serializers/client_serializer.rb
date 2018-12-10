class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :lastname, :address, :phone, :mail, :ci, :count, :nit, :nameinvoice
  has_many :orders
end
