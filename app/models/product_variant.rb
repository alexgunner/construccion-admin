class ProductVariant < ApplicationRecord
  default_value_for :available, false
  belongs_to :product
  has_one :stock
  has_many :carts
  has_many :sold_products
  def in_offer
  	if self.offer
  		return "Sí"
  	else
  		return "No"
  	end
  end
end
