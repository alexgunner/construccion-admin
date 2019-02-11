class CarouselSerializer < ActiveModel::Serializer
  attributes :id, :picture, :main

  def picture
    object.pic.url
  end

  def main
    object.pic_type
  end
end
