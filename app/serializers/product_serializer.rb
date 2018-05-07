class ProductSerializer < ActiveModel::Serializer
  attributes :name, :description, :price, :color, :code, :picture
  belongs_to :category
  belongs_to :subcategory
  belongs_to :provider
  belongs_to :manufacturer
  belongs_to :measure
  has_many :carts
end
