class StockSerializer < ActiveModel::Serializer
  attributes :id, :store_id, :product_id, :variant_id, :quantity, :limit
  belongs_to :store
end
