class PictureSerializer < ActiveModel::Serializer
  attributes :id, :picture_url
  has_one :product
end
