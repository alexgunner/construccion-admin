class Cart < ApplicationRecord
  belongs_to :order
  belongs_to :product_variant
end
