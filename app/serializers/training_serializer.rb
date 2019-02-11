class TrainingSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url, :videolink

  def url
    object.docu.url
  end
end
