class CartSerializer < ActiveModel::Serializer
  attributes :quantity, :role
  belongs_to :order
  belongs_to :product_variant
end
