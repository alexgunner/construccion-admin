class Order < ApplicationRecord
    has_many :carts
    belongs_to :client
    belongs_to :delivery

    def self.search(search)
      if search
        Order.where('state LIKE ? or id LIKE ?', "%#{search}%", "%#{search}%")
      else
        Order.all
      end
    end
end
