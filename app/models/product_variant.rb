class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :stocks
  has_many :carts
  def in_offer
  	if self.offer
  		return "Sí"
  	else
  		return "No"
  	end
  end
end
