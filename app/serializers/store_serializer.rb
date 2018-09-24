class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :state
  has_many :stocks
end
