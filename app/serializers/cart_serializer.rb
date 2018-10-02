class CartSerializer < ActiveModel::Serializer
  attributes :quantity
  has_one :order
  has_one :product_variant
end
