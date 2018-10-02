class StockSerializer < ActiveModel::Serializer
  attributes :store_id, :product_id, :product_variant_id, :quantity, :limit
  belongs_to :store
  belongs_to :product
  belongs_to :product_variant
end
