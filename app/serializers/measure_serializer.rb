class MeasureSerializer < ActiveModel::Serializer
  attributes :name, :abbreviation
  has_many :products
end
