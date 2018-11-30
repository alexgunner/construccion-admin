class ProductVariantSerializer < ActiveModel::Serializer
  attributes :size, :price, :wholesaleprice, :specialistprice, :importerprice, :description, :code, :available, :offerprice, :picture, :weight
  belongs_to :product
  has_many :carts
  has_many :stocks
end
