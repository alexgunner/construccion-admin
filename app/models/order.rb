class Order < ApplicationRecord
    has_many :carts
    belongs_to :client
end