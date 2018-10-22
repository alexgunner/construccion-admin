class UserSerializer < ActiveModel::Serializer
  attributes :name, :lastname, :email, :ci, :phone, :nit, :address, :image, :password,
  :password_confirmation
end
