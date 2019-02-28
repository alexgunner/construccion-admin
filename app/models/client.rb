class Client < ApplicationRecord
  has_many :orders, dependent: :delete_all
  belongs_to :destination
  def self.search(search)
    if search!= "Todos"
      Client.where('role LIKE ?',"%#{search}%")
    else
      Client.all.order('count DESC')
    end
  end
end
