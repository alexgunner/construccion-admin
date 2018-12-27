class CategorySerializer < ActiveModel::Serializer
  attributes :name, :description, :picture
  has_many :subcategories
  has_many :products
end
