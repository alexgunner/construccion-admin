class Product < ApplicationRecord
  belongs_to :measure
  belongs_to :provider
  belongs_to :manufacturer
  belongs_to :category
  belongs_to :subcategory
end
