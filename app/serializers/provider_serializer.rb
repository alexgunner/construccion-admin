class ProviderSerializer < ActiveModel::Serializer
  attributes :name, :description
  has_many :products
end
