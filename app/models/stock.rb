class Stock < ApplicationRecord
  belongs_to :product
  belongs_to :product_variant
end
