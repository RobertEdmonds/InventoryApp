class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cost, :inventory, :color

  has_many :pictures 
  has_many :orders 
end
