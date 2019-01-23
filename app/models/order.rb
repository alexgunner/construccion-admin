class Order < ApplicationRecord
    has_many :carts
    belongs_to :client
    belongs_to :delivery
    has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
    def self.search(search)
      if search
        Order.where('state LIKE ? or id LIKE ?', "%#{search}%", "%#{search}%")
      else
        Order.all
      end
    end

    def self.search_by_role(search)
      if search!="Todos"
        Order.joins(:client).where('role LIKE ?', "%#{search}%")
      else
        Order.all
      end
    end
end
