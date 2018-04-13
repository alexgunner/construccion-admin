class SubcategorySerializer < ActiveModel::Serializer
  attributes :name, :description

  belongs_to :category
end
