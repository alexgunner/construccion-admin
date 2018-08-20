class CategorySerializer < ActiveModel::Serializer
  attributes :name, :description, :picture
  has_many :subcategories
end
