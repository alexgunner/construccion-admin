class ProductVariantSerializer < ActiveModel::Serializer
  attributes :size, :price, :wholesaleprice, :specialistprice, :description, :code, :reposition_date, :reposition, :offerprice
  belongs_to :product
  has_many :stocks
end
