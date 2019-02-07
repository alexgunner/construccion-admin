class TrainingSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url

  def url
    object.docu.url
  end
end
