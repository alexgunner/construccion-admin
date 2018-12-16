class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   def self.search(search)
     if search
       User.where('name LIKE ? or lastname LIKE ?', "%#{search}%", "%#{search}%")
     else
       User.all
     end
   end
end
