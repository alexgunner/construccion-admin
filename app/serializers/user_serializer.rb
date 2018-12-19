class UserSerializer < ActiveModel::Serializer
  attributes :name, :namecompany, :email, :ci, :phone, :nit, :address, :image, :password,
  :password_confirmation, :cellphone, :cellwsp, :nameinvoice
end
