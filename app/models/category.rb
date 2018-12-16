class Category < ApplicationRecord
    has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
    has_many :subcategories
    has_many :products

    def self.search(search)
      if search
        Category.where('name LIKE ?', "%#{search}%")
      else
        Category.all
      end
    end
end
