class Service < ApplicationRecord
	has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :pic, content_type: /\Aimage\/.*\z/
end
