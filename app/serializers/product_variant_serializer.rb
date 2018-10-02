class ProductVariantSerializer < ActiveModel::Serializer
  attributes :size, :price, :wholesaleprice, :specialistprice, :importerprice, :description, :code, :reposition_date, :reposition, :offerprice
  belongs_to :product
  has_many :carts
  has_many :stocks
end
