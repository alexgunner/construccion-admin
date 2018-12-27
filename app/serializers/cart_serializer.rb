class CartSerializer < ActiveModel::Serializer
  attributes :quantity, :role, :product_variant_id
  belongs_to :order
  belongs_to :product_variant
end
