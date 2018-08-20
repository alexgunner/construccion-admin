class ContactSerializer < ActiveModel::Serializer
  attributes :phone, :address, :email, :facebook, :about, :mission, :vision, :lat, :long, :picture
end
