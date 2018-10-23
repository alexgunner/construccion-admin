class CartSerializer < ActiveModel::Serializer
  attributes :quantity, :role
  has_one :order
  has_one :product_variant
end
