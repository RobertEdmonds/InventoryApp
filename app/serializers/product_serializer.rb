class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cost, :inventory, :color
end
