class Client < ApplicationRecord
  has_many :orders

  def self.search(search)
    if search!= "Todos"
      Client.where('role LIKE ?',"%#{search}%")
    else
      Client.all
    end
  end
end
