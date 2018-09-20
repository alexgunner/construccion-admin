class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :state
end
