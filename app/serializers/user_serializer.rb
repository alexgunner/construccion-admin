class UserSerializer < ActiveModel::Serializer
  attributes :firstName, :lastName, :mail, :ci, :phone, :encrypted_password, :nit, :address, :imagenit, :imageci
end
