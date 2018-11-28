class ProductVariantSerializer < ActiveModel::Serializer
  attributes :size, :price, :wholesaleprice, :specialistprice, :importerprice, :description, :code, :repositiondate, :reposition, :offerprice, :picture
  belongs_to :product
  has_many :carts
  has_many :stocks
end
