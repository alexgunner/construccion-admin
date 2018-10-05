class UserSerializer < ActiveModel::Serializer
  attributes :name, :lastname, :email, :ci, :phone, :nit, :address, :imagenit, :imageci, :password,
  :password_confirmation
end
