class UserSerializer < ActiveModel::Serializer
  attributes :name, :lastname, :email, :ci, :phone, :nit, :address, :imagenit, :imageci, :password,
  :password_confirmation

  def imagenit
    if object.imagenit.present?
      {
        filename: object.imagenit_file_name
      }
    end
  end
end
