class Product < ApplicationRecord
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  has_attached_file :picture2, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture2, content_type: /\Aimage\/.*\z/
  has_attached_file :picture3, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture3, content_type: /\Aimage\/.*\z/
  has_attached_file :picture4, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture4, content_type: /\Aimage\/.*\z/
  has_attached_file :details
  validates_attachment_content_type :details, content_type: "application/pdf"
  belongs_to :measure
  belongs_to :provider
  belongs_to :manufacturer
  belongs_to :category
  belongs_to :subcategory
  has_many :product_variants
  has_many :stocks

  def in_offer
  	if self.offer
  		return "Sí"
  	else
  		return "No"
  	end
  end

  def set_offer(id, state)
    product = Product.find(id)
    product.offer = state
    product.save
  end

  def self.search(search)
    if search
      Product.where('name LIKE ?', "%#{search}%")
    else
      Product.all.order('id DESC')
    end
  end
end
