class StockSerializer < ActiveModel::Serializer
  attributes :id, :store_id, :product_id, :variant_id, :quantity, :limit
  belongs_to :store
  belongs_to :product
  belongs_to :product_variant
end
