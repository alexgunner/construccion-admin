class ProviderSerializer < ActiveModel::Serializer
  attributes :name, :description, :email, :phone, :address, :country, :city
  has_many :products
end
