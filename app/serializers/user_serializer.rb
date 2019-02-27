class UserSerializer < ActiveModel::Serializer
  attributes :name, :namecompany, :email, :ci, :phone, :nit, :address, :imagenit, :password,
  :password_confirmation, :cellphone, :cellwsp, :nameinvoice, :imageci, :role, :city
end
