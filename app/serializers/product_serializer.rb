class ProductSerializer < ActiveModel::Serializer
  attributes :reference_code, :name, :description, :reference_code, :picture, :offer, :details
  belongs_to :category
  belongs_to :subcategory
  belongs_to :provider
  belongs_to :manufacturer
  belongs_to :measure
  has_many :carts
  has_many :product_variants
end
