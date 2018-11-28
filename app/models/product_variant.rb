class ProductVariant < ApplicationRecord
  default_value_for :available, false
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
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
