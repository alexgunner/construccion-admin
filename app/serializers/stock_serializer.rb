class StockSerializer < ActiveModel::Serializer
  attributes :product_id, :product_variant_id, :quantity, :limit
  belongs_to :product
  belongs_to :product_variant
end
