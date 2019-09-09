class ProductVariantSerializer < ActiveModel::Serializer
  attributes :size, :price, :wholesaleprice, :specialistprice, :importerprice, :description, :code, :available, :offerprice, :weight
  belongs_to :product
  has_many :carts
  has_one :stock
end
