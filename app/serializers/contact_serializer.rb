class ContactSerializer < ActiveModel::Serializer
  attributes :id, :address, :phone, :email, :facebook
end
