class Order < ApplicationRecord
    default_value_for :orderdate, DateTime.now
    default_value_for :state, "Nuevo"
    has_many :carts, dependent: :delete_all
    belongs_to :client
    has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
    has_attached_file :deposit, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :deposit, content_type: /\Aimage\/.*\z/
    def self.search(search)
      if search
        Order.where('state LIKE ?', "%#{search}%")
      else
        Order.all.order('id ASC')
      end
    end

    def self.search_by_role(search)
      if search!="Todos"
        Order.joins(:client).where('role LIKE ?', "%#{search}%")
      else
        Order.all.order('id DESC')
      end
    end
end
