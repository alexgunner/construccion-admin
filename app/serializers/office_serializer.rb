class OfficeSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :phone, :cellphone, :cellwsp, :address, :lat, :long, :email
end
