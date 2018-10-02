class StoreSerializer < ActiveModel::Serializer
  attributes :name, :description, :state
  has_many :stocks
end
