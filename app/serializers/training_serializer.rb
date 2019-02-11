class TrainingSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url, :videourl

  def url
    object.docu.url
  end
end
