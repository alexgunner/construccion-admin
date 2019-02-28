class Cart < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product_variant
  belongs_to :user
end
