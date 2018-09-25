class Stock < ApplicationRecord
  belongs_to :store
  belongs_to :product
  belongs_to :product_variant, :optional => true
end
