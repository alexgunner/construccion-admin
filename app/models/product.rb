class Product < ApplicationRecord
  belongs_to :measure
  belongs_to :provider
  belongs_to :manufacturer
  belongs_to :category
  belongs_to :subcategory
  
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
