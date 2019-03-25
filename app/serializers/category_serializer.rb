class CategorySerializer < ActiveModel::Serializer
  attributes :name, :description, :picture, :number 
  has_many :subcategories
  has_many :products
end
