class ProductVariantSerializer < ActiveModel::Serializer
  attributes :id, :variant_size, :price, :product_id, :description, :reference_code, :reposition, :offer, :offer_price
  belongs_to :products
end
