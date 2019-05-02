class IndustrySerializer < ActiveModel::Serializer
  attributes :id, :country, :origin
  has_many :products
end
