class SubcategorySerializer < ActiveModel::Serializer
  attributes :name, :description, :picture
  belongs_to :category
end
