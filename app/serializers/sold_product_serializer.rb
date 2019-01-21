class SoldProductSerializer < ActiveModel::Serializer
  attributes :id, :product_variant_id, :quantity
end
