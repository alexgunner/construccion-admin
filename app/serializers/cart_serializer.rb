class CartSerializer < ActiveModel::Serializer
  attributes :quantity, :role, :product_variant_id, :state
  belongs_to :order
  belongs_to :product_variant
  belongs_to :user
end
