class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone, :mail, :ci, :count, :nit, :nameinvoice, :cellphone, :cellwsp
  has_many :orders
end
