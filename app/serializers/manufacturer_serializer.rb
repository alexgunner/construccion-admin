class ManufacturerSerializer < ActiveModel::Serializer
  attributes :name, :description, :address, :email, :phone, :country, :city
  has_many :products
end
