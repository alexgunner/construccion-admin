class ProductVariant < ApplicationRecord
  belongs_to :product

  def in_offer
  	if self.offer
  		return "Sí"
  	else
  		return "No"
  	end
  end
end
