class ProductVariantSerializer < ActiveModel::Serializer
  attributes :id, :variant_size, :price, :whole_sale_price, :specialist_price, :product_id, :description, :reference_code, :reposition, :offer_price
  belongs_to :products
  has_many :stocks
end
