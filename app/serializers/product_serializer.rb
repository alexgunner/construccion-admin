class ProductSerializer < ActiveModel::Serializer
  attributes :name, :description, :code, :picture, :offer, :details, :picture2, :picture3, :picture4
  belongs_to :category
  belongs_to :subcategory
  belongs_to :provider
  belongs_to :manufacturer
  belongs_to :measure
  has_many :product_variants
  has_many :stocks
  belongs_to :industry
end
